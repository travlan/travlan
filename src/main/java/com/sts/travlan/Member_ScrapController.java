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

import com.model.mapper.Member_ScrapMapper;
import com.model.member.Member_ScrapDTO;
import com.sts.travlan.Utility;

@Controller
public class Member_ScrapController {
	
	Utility util = new Utility();
	
	@Autowired
	private Member_ScrapMapper mapper;
	
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
		
		if(mapper.scrap(dto) > 0) {
			return_data.put("flag", "Y");
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
	
}