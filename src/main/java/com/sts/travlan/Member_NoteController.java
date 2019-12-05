package com.sts.travlan;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.mapper.Member_NoteMapper;
import com.model.mapper.MemberMapper;
import com.model.member.Member_NoteDTO;
import com.model.member.MemberDTO;
import com.model.post.PostDTO;
import com.sts.travlan.Utility;

@Controller
public class Member_NoteController {
	
	Utility util = new Utility();
	
	@Autowired
	private Member_NoteMapper mapper;
	@Autowired
	private MemberMapper memberMapper;
	
	@GetMapping("/note/send")
	public String sendMessage(HttpSession session, HttpServletRequest request, Model model) {

		int memberNumber = Integer.parseInt(request.getParameter("user"));

		MemberDTO member = memberMapper.getMember(memberNumber);
		model.addAttribute("num", memberNumber);
		model.addAttribute("username", member.getNickname());
		
		return util.isLoginFilter(session, "/note/send");
	}
	
	@ResponseBody
	@RequestMapping("/note/sending")
	public String post(HttpSession session, Member_NoteDTO dto){
		
		dto.setSend_user( (Integer) session.getAttribute("num"));
		System.out.println("" + dto);
		
		if (mapper.sendNote(dto) > 0) {
			return "sucess";
		} else {
			return "fail";
		}
	}
	
	@GetMapping("/note/read")
	public String readMessage(HttpSession session) {
		
		return util.isLoginFilter(session, "/note/read");
	}
	
	@GetMapping("/note")
	public String userMessage(HttpSession session, Model model) {
		
		List<Member_NoteDTO> list = mapper.getUserNotes((Integer)session.getAttribute("num"));
		
		model.addAttribute("list", list);
		
		return util.isLoginFilter(session, "/note");
	}
	
	
}