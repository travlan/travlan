package com.sts.travlan;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.mapper.PostMapper;
import com.model.post.PostDTO;

@Controller
public class PostController {
	Utility util = new Utility();
	
	@Autowired
	private PostMapper mapper;

	@GetMapping("/post_write")
	public String post(HttpSession session) {
	
		return util.isLoginFilter(session, "/post_write");
	}
	
	@PostMapping("/post_write")
	public String post(PostDTO dto, HttpServletRequest request){
		String time = "";
			
		if(!request.getParameter("time_day").equals("null"))
			time += request.getParameter("time_day");
		
		if(!request.getParameter("time_night").equals("null"))
			time += request.getParameter("time_night");
		
		if("DN".equals(time)) {
			time = "A";
		}
	
		dto.setTime(time);
		
		if (mapper.create(dto) > 0) {
			return "redirect:post_list";
		} else {
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping("/utility/file_uploader")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			String sFileInfo = "";
			
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
		
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			filename_ext = filename_ext.toLowerCase();
			
			// 파일 경로설정
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			String filePath = dftFilePath + "storage" + File.separator + "photo_upload" + File.separator;
			
			File file = new File(filePath);

			if (!file.exists()) {
				file.mkdirs();
			}

			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;

			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}

			if (is != null) {
				is.close();
			}

			os.flush();
			os.close();
			///////////////// 서버에 파일쓰기 /////////////////

			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함

			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL=" + "../../travlan/storage/photo_upload/" + realFileNm;
			
			PrintWriter print = response.getWriter();

			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
