package com.sts.travlan;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.mapper.MemberMapper;
import com.model.member.MemberDTO;

@Controller
public class MemberController {
	@Autowired
	private MemberMapper mapper;
	
	@GetMapping("/login")
	public String login() {

		return "/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session) {

			int flag = mapper.login(map);
			
			if(flag > 0) {
				session.setAttribute("id", map.get("id"));
				return "/home";
			}else {
				return "/babo";
			}
	}
	
	@GetMapping("/register")
	public String register() {
		return "/register";
	}
	
	@PostMapping("/register")
	public String register(@RequestParam MemberDTO dto) {
		
		
		return "/home";
	}
	
	@GetMapping("/register2")
	public String register2() {
		return "/register2";
	}
}
