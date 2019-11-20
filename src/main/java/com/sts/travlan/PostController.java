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
	@Autowired
	private PostMapper mapper;

	@GetMapping("/post_write")
	public String post() {

		return "/post_write";
	}
	
	@PostMapping("/post_write")
	public String post(PostDTO dto){
		
		if (mapper.create(dto) == 1) {
			return "/";
		} else {
			return "/";
		}
	}
	
	@ResponseBody
	@RequestMapping("/utility/file_uploader")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			
			// 확장자를 소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			
			// 파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "storage" + File.separator + "photo_upload" + File.separator;
			
			System.out.println(filePath);
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

			// 정보 출력

			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함

			sFileInfo += "&sFileName=" + filename;
<<<<<<< HEAD

			sFileInfo += "&sFileURL=" + "../../travlan/storage/photo_upload/" + realFileNm;

			sFileInfo += "&sFileURL=" + "travlan/resource/photo_upload/" + realFileNm;

=======
			sFileInfo += "&sFileURL=" + "../../travlan/storage/photo_upload/" + realFileNm;
>>>>>>> 3e6c71415b54b4a1f06a4a34fbf4df21a8b300e4
			PrintWriter print = response.getWriter();

			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
