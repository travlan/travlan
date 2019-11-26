package com.sts.travlan;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.mapper.MemberMapper;
import com.model.member.MemberDTO;
import com.model.member.Member_InfoDTO;
import com.sts.travlan.Utility;

@Controller
public class AdminController {

	Utility util = new Utility();
	
	@Autowired
	private MemberMapper mapper;
	
	@GetMapping("/admin")
	public String admin() {
		return "/admin";
	}
	
}
