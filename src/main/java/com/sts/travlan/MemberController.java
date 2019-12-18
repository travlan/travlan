package com.sts.travlan;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.mapper.MemberMapper;
import com.model.mapper.Member_NoteMapper;
import com.model.member.MemberDTO;
import com.model.member.Member_InfoDTO;
import com.sts.travlan.Utility;

@Controller
public class MemberController {
	Utility util = new Utility();
	
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private Member_NoteMapper note_mapper;
	@Autowired
	private JavaMailSenderImpl mailSender;

	
	@GetMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		String redi = request.getHeader("referer").toString().substring(29);
		request.setAttribute("redi", redi);
		
		return "/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, Model model, HttpServletRequest request) throws NoSuchAlgorithmException {
		String encpw = util.encryptPassword(map.get("password"));
		Map<String, String> loginmap = new HashMap<String, String>();

		loginmap.put("id", map.get("id"));
		loginmap.put("password", encpw);
		int flag = mapper.login(loginmap);
		
		if(flag > 0) {
			MemberDTO dto = mapper.getMember(mapper.get_unique_number(map.get("id")));
			session.setAttribute("id", map.get("id"));
			session.setAttribute("num", dto.getNum());
			session.setAttribute("nickname", dto.getNickname());
			
			String redi = map.get("redi");
			if(redi == "")
				redi = "/";
			
			return "redirect:" + redi;
		} else {
			model.addAttribute("msg", "failure");
			return "/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		request.setAttribute("msg", "로그아웃 되었습니다.");
		return "/arlet";
	}
	
	@GetMapping("/register")
	public String register(HttpSession session) {
		
		return util.isLoginFilter(session);
	}
	
	@PostMapping("/register")
	public String register(MemberDTO dto, HttpServletRequest request) throws NoSuchAlgorithmException {
		String pw = dto.getPassword();
		dto.setPassword(util.encryptPassword(pw));
		
		if (mapper.create(dto) == 1) {
			request.setAttribute("msg", "회원가입 성공!");
			request.setAttribute("id", dto.getId());
			request.setAttribute("num",mapper.get_unique_number(dto.getId()));
			return "register_additional_info";
		} else {
			request.setAttribute("msg", "회원가입 실패!");
			return "/arlet";
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
			return "redirect:/";
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
			map.put("flag", "N");
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
			map.put("flag", "N");
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
			map.put("flag", "N");
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
	public Map<String, Object> find_passwd(String id, String email) throws NoSuchAlgorithmException {
		
		Map<String, String> find = new HashMap<String, String>();
		find.put("id", id);
		find.put("email", email);
		
		String fpasswd = mapper.find_passwd(find);	// TODO 나중에 지우기!
		
		Map<String, Object> resultmap = new HashMap<String, Object>();
		if(fpasswd == null) {
			resultmap.put("result", "N");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			String newpasswd = util.sendPwtoEmail(email, id, mailSender);
			
			System.out.println(newpasswd);
			map.put("id", id);
			map.put("password", util.encryptPassword(newpasswd));
			int flag = mapper.passwd_change(map);
			if(flag > 0) {
				resultmap.put("result", "Y");
			}else {
				resultmap.put("result", "N");
			}
		}
		
		return resultmap;
	}
	
	
	@RequestMapping("/myinfo")
	public String myinfo(HttpSession session, Model model) {
		if(session.getAttribute("num") == null) {
			return util.isLoginFilter(session, "/myinfo");
		}
		
		MemberDTO dto = mapper.getMember((Integer)session.getAttribute("num"));
		boolean is_info = mapper.is_info((String)session.getAttribute("id")) > 0 ? true : false;
		
		if(is_info) {
			Member_InfoDTO idto = mapper.getMemberInfo(dto.getNum());
			
			if(idto.getGender().equals("F")){
				idto.setGender("여성");
			}else{
				idto.setGender("남성");
			}

			model.addAttribute("idto", idto);
		}
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
	public Map<String, Object> currentpassword(String password, HttpSession session) throws NoSuchAlgorithmException {
		
		Map<String, String> current = new HashMap<String, String>();
		current.put("id", (String)session.getAttribute("id"));
		current.put("password", util.encryptPassword(password));
		
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
	public String passwd_check(String password, HttpSession session) throws NoSuchAlgorithmException {
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("password", util.encryptPassword(password));
		
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
	public Map<String, Object> oldpassword(String password, HttpSession session) throws NoSuchAlgorithmException {
		
		Map<String, String> old = new HashMap<String, String>();
		old.put("id", (String) session.getAttribute("id"));
		old.put("password", util.encryptPassword(password));
			
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
	public String passwd_change(String password, HttpSession session) throws NoSuchAlgorithmException {
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("password", util.encryptPassword(password));
		
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
	
	@ResponseBody
	@GetMapping(value = "/nicknamechange", produces="application/json;charset=utf-8")
	public Map<String, Object> nicknamechange(String nickname, MemberDTO dto, HttpSession session){
		
		Map change = new HashMap();
		change.put("num", (Integer)session.getAttribute("num"));
		change.put("nickname", nickname);
		
		int nicknamechange = mapper.nicknamechange(change);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(nicknamechange > 0) {
			session.removeAttribute("nickname");
			session.setAttribute("nickname", dto.getNickname());
			
			map.put("flag", "Y");
			map.put("nickname", nickname);
		} else {
			map.put("flag", "N");
		}
		
		return map;
	}
		
	@GetMapping("/updateAdditionalInfo")
	public String updateAdditionalInfo(){
		
		return "/updateAdditionalInfo";
	}
	
	@PostMapping("/updateAdditionalInfo")
	public String updateAdditionalInfo(Member_InfoDTO dto, HttpServletRequest request){
		String type = "";
		type += request.getParameter("type1");
		type += request.getParameter("type2");
		type += request.getParameter("type3");
		dto.setType(type);
		
		if(mapper.additionalchange(dto) > 0) {
			return "redirect:/myinfo";
		}else {
			return "";
		}
	}
	
	
	@GetMapping("/inputAdditionalInfo")
	public String inputAdditionalInfo(){
		
		return "/inputAdditionalInfo";
	}
	
	@PostMapping("/inputAdditionalInfo")
	public String inputAdditionalInfo(Member_InfoDTO dto, HttpServletRequest request){
		String type = "";
		type += request.getParameter("type1");
		type += request.getParameter("type2");
		type += request.getParameter("type3");
		dto.setType(type);
		
		if(mapper.create_member_info(dto) > 0) {
			return "redirect:/myinfo";
		}else {
			return "";
		}
	}
	
}
