package com.sts.travlan;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		
		session.invalidate();
		request.setAttribute("sys_msg", "로그아웃 되었습니다.");
		return "redirect:/";
	}
	
	@GetMapping("/register")
	public String register() {
		
		
		
		return "/register";
	}
	
	@PostMapping("/register")
	public String register(MemberDTO dto, HttpServletRequest request) {
		
		if (mapper.create(dto) == 1) {
			request.setAttribute("sys_msg", "회원가입 성공!");
			request.setAttribute("id", dto.getId());
			return "register_additional_info";
		} else {
			request.setAttribute("sys_msg", "회원가입 실패!");
			return "redirect:/";
		}
		
		
	}
	
	@GetMapping("/register_additional_info")
	public String register_additional_info(HttpServletRequest request){
		return "/register_additional_info";
	}
	
	@PostMapping("/register_additional_info")
	public String register_additional_info() {
		
		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping(value = "/idcheck", produces = "application/json;charset=utf-8")
	public Map<String, Object> idcheck(String id) {

		int flag = mapper.id_duplicate_check(id);

		Map<String, Object> map = new HashMap<String, Object>();

		if (flag > 0) {
			map.put("flag","N");;
		} else {
			map.put("flag", "Y");
		}

		return map;
	}
	
	@ResponseBody
	@GetMapping(value = "/emailcheck", produces = "application/json;charset=utf-8")
	public Map<String, Object> emailcheck(String email) {

		int flag = mapper.email_duplicate_check(email);

		Map<String, Object> map = new HashMap<String, Object>();

		if (flag > 0) {
			map.put("flag","N");;
		} else {
			map.put("flag", "Y");
		}

		return map;
	}
	
	@GetMapping("/forgot")
	public String forgot() {
		
		return "/forgot";
	}
	
	@GetMapping("/id_find")
	public String id_find() {
		
		return "/id_find";
	}
	
	@PostMapping("/id_find_Proc")
	public String id_find_Proc(String email, Model model) {
		
		String id = mapper.id_find(email);
		
		model.addAttribute("id", id);
		
		return "/id_find_Proc";
	}
	
	@GetMapping("/passwd_find")
	public String passwd_find() {
		
		return "/passwd_find";
	}
	
	@PostMapping("/passwd_find_Proc")
	public String passwd_find_Proc(String id, String email, Model model) {
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("email", email);
		
		String passwd = mapper.passwd_find(map);
		
		model.addAttribute("passwd", passwd);
		
		return "/passwd_find_Proc";
	}
	

}
