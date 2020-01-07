package com.sts.travlan;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
	@RequestMapping("/error500")
	public String error500(HttpServletRequest request, Model model) {
		String html = "<img src='/image/500.png' style='max-width: 100%; height: auto; margin-bottom: 20px'>";
		model.addAttribute("msg", html);
		
		return "/arlet";
	}
	
	@RequestMapping("/error404")
	public String error404(HttpServletRequest request, Model model) {
		String html = "<img src='/image/404.png' style='max-width: 100%; height: auto; margin-bottom: 20px'>";
		model.addAttribute("msg", html);
		
		return "/arlet";
	}
	
	@RequestMapping("/error400")
	public String error400(HttpServletRequest request, Model model) {
		String html = "<img src='/image/400.png' style='max-width: 100%; height: auto; margin-bottom: 20px'>";
		model.addAttribute("msg", html);
		
		return "/arlet";
	}

}
