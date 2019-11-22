package com.sts.travlan;

import javax.servlet.http.HttpSession;

public class Utility {
	
	public String isLoginFilter(HttpSession session, String uri) {
	if ((String)session.getAttribute("id") == null) {
		return "/login";
		}else {
			return uri;
		}
	}
	
	public String isLoginFilter(HttpSession session) {
		if ((String)session.getAttribute("id") == null) {
			return "/register";
		}else {
			return "redirect:home";
		}
	}
}
