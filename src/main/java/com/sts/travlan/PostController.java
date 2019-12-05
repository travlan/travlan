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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model.mapper.MemberMapper;
import com.model.mapper.Member_ScrapMapper;
import com.model.mapper.PostMapper;
import com.model.mapper.CommentMapper;
import com.model.member.MemberDTO;
import com.model.post.PostDTO;
import com.model.post.CommentDTO;

@Controller
public class PostController {
	Utility util = new Utility();
	
	@Autowired
	private PostMapper post_mapper;
	@Autowired
	private MemberMapper member_mapper;
	@Autowired
	private Member_ScrapMapper scrap_mapper;
	@Autowired
	private CommentMapper comment_mapper;
	
	
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
	
	@GetMapping("/post_delete")
	public String delete(HttpSession session, int num, Model model) {
		PostDTO post = post_mapper.read(num);
		int sessionNum = (Integer)session.getAttribute("num") != null ? (Integer)session.getAttribute("num") : -1;
		
		if(post.getMember_num() == sessionNum) {
			return "/post_delete";
		}else {
		return util.isLoginFilter(session, "/post_delete");
		}
	}
	
	@PostMapping("/post_delete")
	public String delete() {
		
		return "redirect:/";
	}
	
	@GetMapping("/post_read")
	public String post_read(int num, Model model, HttpSession session, HttpServletRequest request) {
		
		PostDTO post = post_mapper.read(num);
		MemberDTO author = member_mapper.getMember(post.getMember_num());
		List<CommentDTO> commentList = comment_mapper.list(num);
		CommentDTO commenthigh = comment_mapper.highestRate(num);
		CommentDTO commentlow = comment_mapper.lowestRate(num);
		
		Map scrapMap = new HashMap();
		
		scrapMap.put("member_num", (Integer)session.getAttribute("num"));
		scrapMap.put("post_num", num);
		
		int checkScrap = scrap_mapper.checkScrap(scrapMap);
		
		model.addAttribute("post", post);
		model.addAttribute("author", author);
		model.addAttribute("checkScrap", checkScrap);
		model.addAttribute("comment", commentList);
		model.addAttribute("commenthigh", commenthigh);
		model.addAttribute("commentlow", commentlow);
		
		return "/post_read";
	}
	
	@GetMapping("/post_update")
	public String update(HttpSession session, int num, Model model) {
		PostDTO post = post_mapper.read(num);
		int sessionNum = (Integer)session.getAttribute("num") != null ? (Integer)session.getAttribute("num") : -1;
		
		if(post.getMember_num() == sessionNum) {
			model.addAttribute("post", post);
			model.addAttribute("region", post_mapper.getLocation(post.getRegion_num()));
			return "/post_update";
		}else {
		return util.isLoginFilter(session, "/post_update");
		}
	}
	
	@ResponseBody
	@RequestMapping("/comment_write")
	public String commentWrite(CommentDTO dto, HttpServletRequest request) {
		int score = 0;
		for(int i = 1; i < 6 ; i++) {
			if(request.getParameter("rate" + i) != null) {
				score = i;
			}
		}
		dto.setScore(score);
		int flag = comment_mapper.create(dto);

		if(flag > 0) {
			return "true";
		}else {
			return "false";
		}
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
			String filePath = dftFilePath + "storage" + File.separator + "photo_upload" + File.separator + today_folder + File.separator;
			
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
	public String post_list(HttpSession session, HttpServletRequest request, Model model) {
		
		int pagePost = 9;
		int nowPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		int total = post_mapper.total();
		int lastPage = (total-(total%pagePost))/pagePost;
		int no = 0;
		
		if(nowPage > lastPage) { nowPage = lastPage; }
		no += (nowPage - 1) * pagePost;
		if(no > total) { no = total; }
		
		Map map = new HashMap();
		
		map.put("pagePost", pagePost);
		map.put("no", no);
		System.out.println("Paging : nowPage = " + nowPage + " no = " + no);
		
		List<PostDTO> list = post_mapper.list(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", nowPage);
		model.addAttribute("lastPage", lastPage);
		request.setAttribute("comment_mapper", comment_mapper);
		request.setAttribute("scrap_mapper", scrap_mapper);
		
		return "/home";
	}
	
	@GetMapping("/profile")
	public String profile(HttpServletRequest request, Model model, int num) {
		
		List<PostDTO> list = post_mapper.postList(num);
		MemberDTO author = member_mapper.getMember(num);
		
		List<CommentDTO> comment = comment_mapper.commentlist(num);
		
		model.addAttribute("list", list);
		model.addAttribute("num", num);
		model.addAttribute("author", author);
		model.addAttribute("comment", comment);
		request.setAttribute("comment_mapper", comment_mapper);
		
		return "/profile";
	}
}