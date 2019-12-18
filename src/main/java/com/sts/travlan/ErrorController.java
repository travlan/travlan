package com.sts.travlan;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
	@RequestMapping("/error500")
	public String error500(HttpServletRequest request, Model model) {
		model.addAttribute("msg", "500에러!!");
		
		return "/arlet";
	}
	
	@RequestMapping("/error404")
	public String error404(HttpServletRequest request, Model model) {
		model.addAttribute("msg", "404에러!!");
		
		return "/arlet";
	}
}
