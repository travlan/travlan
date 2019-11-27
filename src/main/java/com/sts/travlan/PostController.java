package com.sts.travlan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.mapper.MemberMapper;
import com.model.mapper.PostMapper;
import com.model.member.MemberDTO;
import com.model.post.PostDTO;

@Controller
public class PostController {
	Utility util = new Utility();
	
	@Autowired
	private PostMapper post_mapper;
	@Autowired
	private MemberMapper member_mapper;

	@GetMapping("/post_write")
	public String post(HttpSession session) {
	
		return util.isLoginFilter(session, "/post_write");
	}
	
	@PostMapping("/post_write")
	public String post(PostDTO dto, HttpServletRequest request){
		
		if (post_mapper.create(dto) > 0) {
			return "redirect:post_list";
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/post_read")
	public String post_read(int num, Model model) {
		
		PostDTO post = post_mapper.read(num);
		MemberDTO author = member_mapper.getMember(post.getMember_num());
		
		model.addAttribute("post", post);
		model.addAttribute("author", author);
		
		return "/post_read";
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
	
	@RequestMapping("/")
	public String post_list(HttpServletRequest request, Model model) {
		
		int pagePost = 8;
		int page = request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
		int total = post_mapper.total();
		int lastPage = (total-(total%pagePost))/pagePost + 1;
		
		if(page > lastPage) {
			page = lastPage;
		}
		
		int sno = (page-1) * pagePost;
		int eno = (page-1) * pagePost + pagePost;
		
		if(eno > total) {
			eno = total;
		}
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<PostDTO> list = post_mapper.list(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("lastPage", lastPage);
		
		return "/home";
	}
}
