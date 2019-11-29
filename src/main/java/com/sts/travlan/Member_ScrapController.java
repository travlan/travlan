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
	public String scraplist(HttpSession session) {
		
		return util.isLoginFilter(session, "/scraplist");
	}
	
	@ResponseBody
	@GetMapping(value = "/scrap", produces = "application/json;charset=utf-8")
	public Map<String, Object> scrap(Map<String, Object> map) {
		Member_ScrapDTO dto = new Member_ScrapDTO();
		
		dto.setPost_num = (Integer) map.get("post_num");
		dto.setMember_num = (Integer) map.get("member_num");
		
		Map<String, Object> return_data = new HashMap<String, Object>();
		if(mapper.scrap(dto) > 0) {
			return_data.put("flag", "Y");
		} else {
			return_data.put("flag", "N");
		}
		
		return return_data;
	}
	
}