package com.sts.travlan;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		
		return util.isLoginFilter(session, "/message/send");
	}
	
	@PostMapping("/note/send")
	public String post(HttpSession session, Member_NoteDTO dto, HttpServletRequest request){

		dto.setSend_user((Integer)session.getAttribute("num"));
		
		if (mapper.sendNote(dto) > 0) {
			return "redirect:/";
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/note/read")
	public String readMessage(HttpSession session) {
		
		
		return util.isLoginFilter(session, "/message/read");
	}
	
	@GetMapping("/note")
	public String userMessage(HttpSession session, Model model) {
		
		List<Member_NoteDTO> list = mapper.getUserNotes((Integer)session.getAttribute("num"));
		
		model.addAttribute("list", list);
		
		return util.isLoginFilter(session, "/message");
	}
	
	
}