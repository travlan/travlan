package com.sts.travlan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.mapper.Member_NotifyMapper;
import com.model.mapper.Member_ScrapMapper;
import com.model.mapper.PostMapper;
import com.model.member.Member_NotifyDTO;
import com.model.member.Member_ScrapDTO;
import com.model.post.PostDTO;
import com.sts.travlan.Utility;

@Controller
public class Member_ScrapController {
	
	Utility util = new Utility();
	
	@Autowired
	private Member_ScrapMapper mapper;
	@Autowired
	private PostMapper post_mapper;
	@Autowired
	private Member_NotifyMapper notify_mapper;
	
	@GetMapping("/scraplist")
	public String scraplist(HttpSession session, Model model) {
		
		List<Member_ScrapDTO> list = mapper.list((Integer)session.getAttribute("num"));
		
		model.addAttribute("list", list);
		
		return util.isLoginFilter(session, "/scraplist");
	}
	
	@ResponseBody
	@PostMapping(value = "/scrap", produces = "application/json;charset=utf-8")
	public Map<String, Object> scrap(int post_num, String memo, HttpSession session) {
		
		Member_ScrapDTO dto = new Member_ScrapDTO();

		dto.setPost_num(post_num);
		dto.setMember_num((Integer)session.getAttribute("num"));
		dto.setMemo(memo);
		
		Map<String, Object> return_data = new HashMap<String, Object>();
		
		if((Integer)session.getAttribute("num") == mapper.getPost(post_num)) {
			return_data.put("flag", "N");
		}
		
		if(mapper.scrap(dto) > 0) {
			return_data.put("flag", "Y");
				
			Member_NotifyDTO notify_dto = new Member_NotifyDTO();
			PostDTO post_dto = post_mapper.read(dto.getPost_num());
			notify_dto.setMember_num(post_dto.getMember_num());
			notify_dto.setPost_num(post_dto.getPost_num());
			notify_dto.setContent("누군가 '" + post_dto.getTitle() + "' 글을 좋아합니다.");
			notify_mapper.create(notify_dto);
		} else {
			return_data.put("flag", "N");
		}
		
		return return_data;
	}
	
	@ResponseBody
	@PostMapping(value = "/deleteScrap", produces = "application/json;charset=utf-8")
	public Map<String, Object> deleteScrap(int post_num, HttpSession session) {
		
		Map map = new HashMap();
		map.put("member_num", (Integer)session.getAttribute("num"));
		map.put("post_num", post_num);
		
		int isDelete = mapper.deleteScrap(map);
		
		Map<String, Object> return_data = new HashMap<String, Object>();
		
		if(isDelete > 0) {
			return_data.put("flag", "Y");
		} else {
			return_data.put("flag", "N");
		}
		
		return return_data;
	}
	
	@ResponseBody
	@PostMapping(value = "/scrapedPost", produces = "application/json;charset=utf-8")
	public Map<String, Object> scrapedPost(int post_num, int member_num, HttpSession session) {
		
		Map scrap = new HashMap();
		scrap.put("member_num", member_num);
		scrap.put("post_num", post_num);
		
		Member_ScrapDTO dto = mapper.scrapedPost(scrap);
		
		Map<String, Object> return_data = new HashMap<String, Object>();
		
		if(dto != null) {
			return_data.put("flag", "Y");
			return_data.put("dto", dto);
		} else {
			return_data.put("flag", "N");
		}
		
		return return_data;
	}
	
	@ResponseBody
	@PostMapping(value = "/updateScrap", produces = "application/json;charset=utf-8")
	public Map<String, Object> updateScrap(int post_num, String memo, HttpSession session) {
		
		Map map = new HashMap();
		map.put("member_num", (Integer)session.getAttribute("num"));
		map.put("post_num", post_num);
		map.put("memo", memo);
		
		int isUpdate = mapper.updateScrap(map);
		
		Map<String, Object> return_data = new HashMap<String, Object>();
		
		if(isUpdate > 0) {
			return_data.put("flag", "Y");
		} else {
			return_data.put("flag", "N");
		}
		
		return return_data;
	}
	
}