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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
			return "redirect:/";
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
	@RequestMapping("/utility/thumbnail_uploader")
	public String thumbnailPhotoUpload(MultipartHttpServletRequest multipartRequest) {
		
	    Iterator<String> itr =  multipartRequest.getFileNames();
		SimpleDateFormat formatter_folder = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter = new SimpleDateFormat("HH-mm-ss-SSS");
		String today_folder = formatter_folder.format(new java.util.Date());
		String today = formatter.format(new java.util.Date());
		// 파일 경로설정
		String dftFilePath = multipartRequest.getSession().getServletContext().getRealPath("/");
		String filePath = dftFilePath + "storage" + File.separator + "photo_thumbnail" + File.separator + today_folder;
		
		File file = new File(filePath);
		String returnFilename = "";
		
		if (!file.exists()) {
			file.mkdirs();
		}
		
		while (itr.hasNext()) {
	        MultipartFile mpf = multipartRequest.getFile(itr.next());
	        
	        String originalFilename = "TN_" + today;
	        String fileFullPath = filePath + File.separator + originalFilename;
	        try {
	            mpf.transferTo(new File(fileFullPath));
	            returnFilename = originalFilename;
	            System.out.println("Upload Success!! " + fileFullPath);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
		return today_folder + "/" + returnFilename;
	}
	
	@ResponseBody
	@RequestMapping("/utility/file_uploader")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			String sFileInfo = "";
			
			SimpleDateFormat formatter_folder = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat formatter = new SimpleDateFormat("HH-mm-ss-SSS");
			String today_folder = formatter_folder.format(new java.util.Date());
			String today = formatter.format(new java.util.Date());
			
			// 파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
		
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			filename_ext = filename_ext.toLowerCase();
			
			// 파일 경로설정
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			String filePath = dftFilePath + "storage" + File.separator + "photo_upload" + File.separator + today_folder;
			
			File file = new File(filePath);

			if (!file.exists()) {
				file.mkdirs();
			}

			String realFileNm = "";
			
			realFileNm = today + filename.substring(filename.lastIndexOf("."));
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
			sFileInfo += "&sFileURL=" + "../../travlan/storage/photo_upload/" + today_folder + "/" + realFileNm;
			
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
		int page = request.getParameter("page")==null? 1 : Integer.parseInt(request.getParameter("page"));
		int total = post_mapper.total();
		int lastPage = (total-(total%pagePost))/pagePost;
		
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
