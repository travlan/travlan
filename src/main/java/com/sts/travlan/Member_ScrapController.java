package com.sts.travlan;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.model.mapper.Member_ScrapMapper;
import com.sts.travlan.Utility;

@Controller
public class Member_ScrapController {
	
	Utility util = new Utility();
	
	@Autowired
	private Member_ScrapMapper mapper;
	
	@GetMapping("/scrap")
	public String scrap(HttpSession session) {
		
		return util.isLoginFilter(session, "/scrap");
	}
	
	
}