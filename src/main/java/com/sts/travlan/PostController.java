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
import java.util.Iterator;

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
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model.mapper.MemberMapper;
import com.model.mapper.Member_NotifyMapper;
import com.model.mapper.Member_ScrapMapper;
import com.model.mapper.PostMapper;
import com.model.mapper.CommentMapper;
import com.model.member.MemberDTO;
import com.model.member.Member_InfoDTO;
import com.model.member.Member_NotifyDTO;
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
	@Autowired
	private Member_NotifyMapper notify_mapper;
	@Autowired
	private TravlanService service;
	
	@GetMapping("/arlet")
	public String arlet(Model model) {
		if(model.containsAttribute("msg")) {
			return "/arlet";
		}else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/post_write")
	public String post(HttpSession session) {
	
		return util.isLoginFilter(session, "/post_write");
	}
	
	@PostMapping("/post_write")
	public String post(PostDTO dto, HttpServletRequest request, HttpSession session, Model model){
		
		String type = "";
		type += request.getParameter("type1");
		type += request.getParameter("type2");
		type += request.getParameter("type3");
		dto.setType(type);
		

		if((Integer)session.getAttribute("num") != dto.getMember_num()) {
			model.addAttribute("msg", "꼼수쓰지 마세요~");
			
			return "/arlet";
		}
		if (post_mapper.create(dto) > 0) {
			return "redirect:/";
		} else {
			model.addAttribute("msg", "글작성 실패!");
			return "/arlet";
		}
	}
	
	@ResponseBody
	@RequestMapping("/post_delete")
	public String delete(HttpSession session, int post_num) {
		try {
			service.postdelete(post_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("member_num", session.getAttribute("num"));
		map.put("post_num", post_num);
		
		if(post_mapper.checkPost(map) == 0) {
			return "true";
		} else {
			return "false";
		}
		
	}
	
	@GetMapping("/search")
	public String search(HttpServletRequest request, HttpSession session, Model model) {
		String value = request.getParameter("value") == "" ? "null" : request.getParameter("value");
		Boolean type1A = request.getParameter("type1A") == null ? false : Boolean.parseBoolean(request.getParameter("type1A"));
		Boolean type1B = request.getParameter("type1B") == null ? false : Boolean.parseBoolean(request.getParameter("type1B"));
		Boolean type2A = request.getParameter("type2A") == null ? false : Boolean.parseBoolean(request.getParameter("type2A"));
		Boolean type2B = request.getParameter("type2B") == null ? false : Boolean.parseBoolean(request.getParameter("type2B"));
		Boolean type3A = request.getParameter("type3A") == null ? false : Boolean.parseBoolean(request.getParameter("type3A"));
		Boolean type3B = request.getParameter("type3B") == null ? false : Boolean.parseBoolean(request.getParameter("type3B"));
		String season = request.getParameter("season") == null ? "null" : request.getParameter("season");
		
		String type1 = "E";
		if((type1A && type1B) || (!type1A && !type1B)) {
			type1 = "E";
		} else if(type1A) {
			type1 = "A";
		} else if(type1B) {
			type1 = "B";
		}
		
		String type2 = "E";
		if((type2A && type2B) || (!type2A && !type2B)) {
			type2 = "E";
		} else if(type2A) {
			type2 = "A";
		} else if(type2B) {
			type2 = "B";
		}
		
		String type3 = "E";
		if((type3A && type3B) || (!type3A && !type3B)) {
			type3 = "E";
		} else if(type3A) {
			type3 = "A";
		} else if(type3B) {
			type3 = "B";
		}
		
		Map map = new HashMap();
		map.put("value", value);
		map.put("type1", type1);
		map.put("type2", type2);
		map.put("type3", type3);
		map.put("season", season);
		
		List<PostDTO> list = post_mapper.search(map);
		model.addAttribute("list", list);
		return "/search";
	}
	
//	@GetMapping("/post_delete")
//	public String delete(HttpSession session, int num, Model model) {
//		PostDTO post = post_mapper.read(num);
//		int sessionNum = (Integer)session.getAttribute("num") != null ? (Integer)session.getAttribute("num") : -1;
//		
//		if(post.getMember_num() == sessionNum) {
//			return "/post_delete";
//		}else {
//			model.addAttribute("msg", "게시글 삭제 페이지 로딩 실패!");
//			
//			return "/arlet";
//		}
//	}
	
	@GetMapping("/post_read")
	public String post_read(int num, Model model, HttpSession session, HttpServletRequest request) {
		
		PostDTO post = post_mapper.read(num);
		MemberDTO author = member_mapper.getMember(post.getMember_num());
		
		List<CommentDTO> commentList = comment_mapper.list(num);
		CommentDTO commenthigh = comment_mapper.highestRate(num);
		CommentDTO commentlow = comment_mapper.lowestRate(num);
		System.out.println(commentList);
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
			model.addAttribute("msg", "게시글 수정 페이지 로딩 실패!");
			
			return "/arlet";
		}
	}
	
	@PostMapping("/post_update")
	public String update(Model model, HttpSession session, HttpServletRequest request, PostDTO dto) {
		String type = "";
		type += request.getParameter("type1");
		type += request.getParameter("type2");
		type += request.getParameter("type3");
		dto.setType(type);
		
		if((Integer)session.getAttribute("num") != dto.getMember_num()) {
			model.addAttribute("msg", "꼼수쓰지 마세요~");
			return "/arlet";
		}else if(post_mapper.update(dto) > 0) {
			return "redirect:/post_read?num=" + dto.getPost_num();
		}else {
			model.addAttribute("msg", "글 수정 실패!");
			return "/arlet";
		}
	}
	
	@ResponseBody
	@RequestMapping("/comment_write")
	public String commentWrite(HttpSession session, CommentDTO dto, HttpServletRequest request) {
		
		int score = 0;
		for(int i = 1; i < 6 ; i++) {
			if(request.getParameter("rate" + i) != null) {
				score = i;
			}
		}
		dto.setScore(score);
		System.out.println(dto);
		if(Integer.parseInt(dto.getMember_num()) != (Integer)session.getAttribute("num") && dto.getPost_num() != (Integer) request.getAttribute("num") ) {
			return "error!";
		}else if(comment_mapper.create(dto) > 0) {
			Member_NotifyDTO notify_dto = new Member_NotifyDTO();
			PostDTO post_dto = post_mapper.read(dto.getPost_num());
			notify_dto.setMember_num(post_dto.getMember_num());
			notify_dto.setPost_num(post_dto.getPost_num());
			notify_dto.setContent("'" + post_dto.getTitle() + "' 글에 댓글이 달렸습니다.");
			notify_mapper.create(notify_dto);
			return "true";
		}else {
			return "false";
		}
	}
	
	@ResponseBody
	@RequestMapping("/comment_update")
	public String commentUpdate(HttpSession session, CommentDTO dto, HttpServletRequest request) {
		
		int score = 0;
		for(int i = 1; i < 6 ; i++) {
			if(request.getParameter("rate" + i) != null) {
				score = i;
			}
		}
		dto.setScore(score);
		System.out.println("Update : " + dto);
		if(Integer.parseInt(dto.getMember_num()) != (Integer)session.getAttribute("num") && 
				dto.getPost_num() != (Integer) request.getAttribute("num") ) {
			return "error!";
		}else if(comment_mapper.update(dto) > 0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@ResponseBody
	@RequestMapping("/comment_delete")
	public String commentDelete(HttpSession session, int num) {
		
		
		Map map = new HashMap();
		map.put("num", num);
		map.put("member_num", (Integer)session.getAttribute("num"));
		
		if(comment_mapper.deleteVerifing(map) > 0) {
			comment_mapper.delete(num);
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
		SimpleDateFormat formatter = new SimpleDateFormat("HHmmss");
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
	        String originalFilename = "TN_" + today + "_" + mpf.getOriginalFilename();
	        String fileFullPath = filePath + File.separator + originalFilename ;
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
			sFileInfo += "&sFileURL=" + "../../travlan_dev/storage/photo_upload/" + today_folder + "/" + realFileNm;
			// ../travlan/storage ~ 부분을 릴리즈 할때는 ROOT로 바꿔주세요
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
		double nowPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		double total = post_mapper.total();
		int lastPage = (int) Math.ceil(total / pagePost);
		int no = 0;
		
		if(nowPage > lastPage) { nowPage = lastPage; }
		no += (nowPage - 1) * pagePost;
		if(no > total) { no = (int)total; }
		
		Map map = new HashMap();
		
		map.put("pagePost", pagePost);
		map.put("no", no);
		
		List<PostDTO> list = post_mapper.list(map);
		
		boolean is_info = member_mapper.is_info((String)session.getAttribute("id")) > 0 ? true : false;
		
		if(is_info) {
			Member_InfoDTO idto = member_mapper.getMemberInfo((Integer)session.getAttribute("num"));
			model.addAttribute("idto", idto);
		}
		model.addAttribute("is_info", is_info);
		
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
		request.setAttribute("post_mapper", post_mapper);
		request.setAttribute("scrap_mapper", scrap_mapper);
		
		return "/profile";
	}
}
