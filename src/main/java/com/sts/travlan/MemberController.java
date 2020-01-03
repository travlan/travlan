package com.sts.travlan;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.model.mapper.MemberMapper;
import com.model.member.MemberDTO;
import com.model.member.Member_InfoDTO;

@Controller
public class MemberController {
	Utility util = new Utility();
	
	private String apiResult = null;
	
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private NaverController navercontroller;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private TravlanService service;
	
	@GetMapping("/login")
	public String login(HttpServletRequest request, HttpSession session, Model model) {
    
		String redi = request.getHeader("referer").toString().substring(29);
		request.setAttribute("redi", redi);
    
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		String naverUrl = navercontroller.getAuthorizationUrl(session);

		model.addAttribute("kakao_url", kakaoUrl);
		model.addAttribute("naver_url", naverUrl);
		
		return "/login";
	}
	
	@RequestMapping(value = "/kakaologin", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {
		
		/* 결과값을 node에 담아줌 */
		JsonNode node = KakaoController.getAccessToken(code);
		/* accessToken에 로그인한 사용자의 모든 정보가 들어있음 */
		JsonNode accessToken = node.get("access_token");
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		
		String kemail = null;
		String kname = null;
		
		/* 유저 정보 카카오에서 가져오기 Get properties */
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		
		session.setAttribute("kemail", kemail);
		session.setAttribute("kname", kname);
		
		System.out.println(kemail);
		System.out.println(kname);
		
		MemberDTO dto = new MemberDTO();
		
		if(mapper.getEmail(kemail) > 0) {
			Map idnpassword = mapper.getIdnPassword(kemail);
			
			String id = (String)idnpassword.get("id");
			String password = (String)idnpassword.get("password");
			
			Map<String, String> loginmap = new HashMap<String, String>();
			loginmap.put("id", id);
			loginmap.put("password", password);
			
			int flag = mapper.login(loginmap);
			dto = mapper.getMember(mapper.get_unique_number(id));
			
			if(flag > 0) {
				session.setAttribute("id", dto.getId());
				session.setAttribute("num", dto.getNum());
				session.setAttribute("nickname", dto.getNickname());
						
				return "redirect:/";
			} else {
				model.addAttribute("msg", "failure");
				return "/login";
			}
		} else {
			dto.setEmail(kemail);
			dto.setNickname(kname);
			dto.setId(util.getRandomIdnPassword(5));
			dto.setPassword(util.encryptPassword(util.getRandomIdnPassword(10)));
			
			if (mapper.create(dto) == 1) {
				request.setAttribute("sys_msg", "회원가입 성공!");
				request.setAttribute("id", dto.getId());
				request.setAttribute("num",mapper.get_unique_number(dto.getId()));
				return "register_additional_info";
			} else {
				request.setAttribute("sys_msg", "회원가입 실패!");
				return "redirect:/";
			}
		}
	}
	
	@RequestMapping(value = "/naverlogin", produces = "application/json;charset=utf-8", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session, Model model, HttpServletRequest request) throws IOException, NoSuchAlgorithmException {
		
		OAuth2AccessToken oauthToken;
		oauthToken = navercontroller.getAccessToken(session, code, state);
		
		/* 로그인한 사용자의 모든 정보가 JSON타입으로 저장되어 있음 */
		apiResult = navercontroller.getUserProfile(oauthToken);
		
		/* 내가 원하는 정보만 JSON타입에서 String타입으로 바꿔 가져오기 위한 작업 */
		JSONParser parser = new JSONParser();
		Object obj = null;
		
		try {
			obj = parser.parse(apiResult);
		} catch(ParseException e) {
			e.printStackTrace();
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONObject jsonobj = (JSONObject)obj;
		JSONObject response = (JSONObject)jsonobj.get("response");
		
		String nname = (String)response.get("name");
		String nemail = (String)response.get("email");
		
		session.setAttribute("nname", nname);
		session.setAttribute("nemail", nemail);
		
		MemberDTO dto = new MemberDTO();
		
		if(mapper.getEmail(nemail) > 0) {
			Map idnpassword = mapper.getIdnPassword(nemail);
			
			String id = (String)idnpassword.get("id");
			String password = (String)idnpassword.get("password");
			
			System.out.println(id);
			System.out.println(password);
			
			Map<String, String> loginmap = new HashMap<String, String>();
			loginmap.put("id", id);
			loginmap.put("password", password);
			
			int flag = mapper.login(loginmap);
			dto = mapper.getMember(mapper.get_unique_number(id));
			
			if(flag > 0) {
				session.setAttribute("id", dto.getId());
				session.setAttribute("num", dto.getNum());
				session.setAttribute("nickname", dto.getNickname());
						
				return "redirect:/";
			} else {
				model.addAttribute("msg", "failure");
				return "/login";
			}
		} else {
			dto.setEmail(nemail);
			dto.setNickname(nname);
			dto.setId(util.getRandomIdnPassword(5));
			dto.setPassword(util.encryptPassword(util.getRandomIdnPassword(10)));
			
			if (mapper.create(dto) == 1) {
				request.setAttribute("sys_msg", "회원가입 성공!");
				request.setAttribute("id", dto.getId());
				request.setAttribute("num",mapper.get_unique_number(dto.getId()));
				return "register_additional_info";
			} else {
				request.setAttribute("sys_msg", "회원가입 실패!");
				return "redirect:/";
			}
		}
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
	public String register_additional_info(Member_InfoDTO dto, HttpServletRequest request, Model model){
		String type = "";
		type += request.getParameter("type1");
		type += request.getParameter("type2");
		type += request.getParameter("type3");
		dto.setType(type);
		
		if(mapper.create_member_info(dto) > 0) {
			return "redirect:/";
		}else {
			model.addAttribute("msg", "추가정보 입력 실패!");
			
			return "/arlet";
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
	public String passwd_check(HttpSession session) {
		
		return util.isLoginFilter(session, "/passwd_check");
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
	public String passwd_check(String password, HttpSession session, Model model) throws NoSuchAlgorithmException {
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("password", util.encryptPassword(password));
		
		int flag = mapper.passwd_check(map);
		
		if(flag > 0) {
			return "/passwd_change";
		} else {
			model.addAttribute("msg", "패스워드 확인 실패!");
			return "/arlet";
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
	public String passwd_change(String password, HttpSession session, Model model) throws NoSuchAlgorithmException {
		
		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("password", util.encryptPassword(password));
		
		int flag = mapper.passwd_change(map);
		
		if(flag > 0) {
			return "redirect:logout";
		} else {
			model.addAttribute("msg", "패스워드 변경 실패!");
			
			return "/arlet";
		}
	}
	
	@GetMapping("/secession")
	public String secession(HttpSession session) {
		
		return util.isLoginFilter(session, "/secession");
	}
	
	@PostMapping("/secession")
	public String secession(HttpSession session, Model model) {
		
		try {
			service.secessiondelete((int)session.getAttribute("num"));
			service.secessionupdate((int)session.getAttribute("num"));
			service.secession((int)session.getAttribute("num"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.invalidate();
			
		return "/bye";
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
	public String updateAdditionalInfo(Member_InfoDTO dto, HttpServletRequest request, Model model){
		String type = "";
		type += request.getParameter("type1");
		type += request.getParameter("type2");
		type += request.getParameter("type3");
		dto.setType(type);
		
		if(mapper.additionalchange(dto) > 0) {
			return "redirect:/myinfo";
		}else {
			model.addAttribute("msg", "추가정보 수정 실패!");
			
			return "/arlet";
		}
	}
	
	
	@GetMapping("/inputAdditionalInfo")
	public String inputAdditionalInfo(){
		
		return "/inputAdditionalInfo";
	}
	
	@PostMapping("/inputAdditionalInfo")
	public String inputAdditionalInfo(Member_InfoDTO dto, HttpServletRequest request, Model model){
		String type = "";
		type += request.getParameter("type1");
		type += request.getParameter("type2");
		type += request.getParameter("type3");
		dto.setType(type);
		
		if(mapper.create_member_info(dto) > 0) {
			return "redirect:/myinfo";
		}else {
			model.addAttribute("msg", "추가정보 입력 실패!");
			
			return "/arlet";
		}
	}
	
}
