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
import com.model.member.MyinfoDTO;
import com.sts.travlan.Utility;

@Controller
public class MemberController {
	Utility util = new Utility();
	
	@Autowired
	private MemberMapper mapper;
	
	@GetMapping("/login")
	public String login() {

		return "/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, Model model) {

			int flag = mapper.login(map);
			MyinfoDTO dto = mapper.getMyinfo(map.get("id"));	
		
			if(flag > 0) {
				session.setAttribute("id", map.get("id"));
				session.setAttribute("num", dto.getNum());
				session.setAttribute("nickname", dto.getNickname());
				return "redirect:/";
			}else {
				model.addAttribute("msg", "failure");
				return "/login";
			}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		
		session.invalidate();
		request.setAttribute("sys_msg", "로그아웃 되었습니다.");
		return "redirect:/";
	}
	
	@GetMapping("/register")
	public String register(HttpSession session) {
		
		return util.isLoginFilter(session);
	}
	
	@PostMapping("/register")
	public String register(MemberDTO dto, HttpServletRequest request) {
		
		if (mapper.create(dto) == 1) {
			request.setAttribute("sys_msg", "회원가입 성공!");
			request.setAttribute("id", dto.getId());
			request.setAttribute("num",mapper.get_unique_number(dto.getId()));
			return "register_additional_info";
		} else {
			request.setAttribute("sys_msg", "회원가입 실패!");
			return "redirect:home";
		}
		
		
	}
	
	@GetMapping("/register_additional_info")
	public String register_additional_info(){
		
		return "/register_additional_info";
	}
	
	@PostMapping("/register_additional_info")
	public String register_additional_info(Member_InfoDTO dto, HttpServletRequest request){
		String type = "";
		type += request.getParameter("type1");
		type += request.getParameter("type2");
		type += request.getParameter("type3");
		dto.setType(type);
		
		if(mapper.create_member_info(dto) > 0) {
			return "";
		}else {
			return "";
		}
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
	
	@ResponseBody
	@GetMapping(value = "/nicknamecheck", produces = "application/json;charset=utf-8")
	public Map<String, Object> nicknamecheck(String nickname) {

		int flag = mapper.nickname_duplicate_check(nickname);

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
	
	@ResponseBody
	@GetMapping(value = "/find_id", produces = "application/json;charset=utf-8")
	public Map<String, Object> find_id(String email) {
		
		String fid = mapper.find_id(email);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(fid == null) {
			map.put("result", "N");
		} else {
			map.put("result", fid);
		}
		
		return map;
	}
	
	@ResponseBody
	@GetMapping(value = "/find_passwd", produces = "application/json;charset=utf-8")
	public Map<String, Object> find_passwd(String id, String email) {
		
		Map<String, String> find = new HashMap<String, String>();
		find.put("id", id);
		find.put("email", email);
		
		String fpasswd = mapper.find_passwd(find);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(fpasswd == null) {
			map.put("result", "N");
		} else {
			map.put("result", fpasswd);
		}
		
		return map;
	}
	
	
	@RequestMapping("/myinfo")
	public String myinfo(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		
		MyinfoDTO dto = mapper.getMyinfo(id);
		int count_info = mapper.is_info(id);
		boolean is_info = count_info>0?true:false;
		
		model.addAttribute("dto", dto);
		model.addAttribute("is_info", is_info);
		
		return util.isLoginFilter(session, "/myinfo");
	}
	
	@GetMapping("/passwd_check")
	public String passwd_check() {
		
		return "/passwd_check";
	}
	
	@ResponseBody
	@GetMapping(value = "/currentpassword", produces = "application/json;charset=utf-8")
	public Map<String, Object> currentpassword(String password, HttpSession session) {
		
		Map<String, String> current = new HashMap<String, String>();
		current.put("id", (String)session.getAttribute("id"));
		current.put("password", password);
		
		int flag = mapper.passwd_check(current);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(flag > 0) {
			map.put("flag", "Y");
		} else {
			map.put("flag", "N");
		}
		
		return map;
	}
	
	@ResponseBody
	@GetMapping(value = "/getRegion", produces="application/json;charset=utf-8")
	public List<Map<String, Object>> getRegion(String province){
		List<Map<String, Object>> list = mapper.getRegion(province);

		return list;
	}
	
	@PostMapping("/passwd_check")
	public String passwd_check(String password, HttpSession session) {
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("password", password);
		
		int flag = mapper.passwd_check(map);
		
		if(flag > 0) {
			return "/passwd_change";
		} else {
			return "/babo";
		}
	}
	
	@GetMapping("/passwd_change")
	public String passwd_change(HttpSession session, Model model) {
		
		return util.isLoginFilter(session, "/passwd_change");
	}
	
	@ResponseBody
	@GetMapping(value = "/oldpassword", produces="application/json;charset=utf-8")
	public Map<String, Object> oldpassword(String password, HttpSession session) {
		
		Map<String, String> old = new HashMap<String, String>();
		old.put("id", (String) session.getAttribute("id"));
		old.put("password", password);
			
		int flag = mapper.passwd_check(old);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(flag > 0) {
			map.put("flag", "Y");
		} else {
			map.put("flag", "N");
		}
		
		return map;
	}
	
	@PostMapping("/passwd_change")
	public String passwd_change(String password, HttpSession session) {
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("password", password);
		
		int flag = mapper.passwd_change(map);
		
		if(flag > 0) {
			return "redirect:myinfo";
		} else {
			return "/babo";
		}
	}
	
	@GetMapping("/secession")
	public String secession() {
		
		return "/secession";
	}
	
	@PostMapping("/secession")
	public String secession(String id) {
		
		int flag = mapper.secession(id);
		
		if(flag > 0) {
			return "/bye";
		} else {
			return "/babo";
		}
	}
	
	@GetMapping("/bye")
	public String bye(HttpSession session) {
		
		return util.isLoginFilter(session, "/bye");
	}
	
	@GetMapping("/scrap")
	public String scrap(HttpSession session) {
		
		return util.isLoginFilter(session, "/scrap");
	}
	
}
