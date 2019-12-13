package com.sts.travlan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.model.mapper.MemberMapper;
import com.model.mapper.ReportMapper;
import com.model.member.MemberDTO;
import com.model.member.ReportDTO;

@Controller
public class ReportController {
	
	Utility util = new Utility();
	
	@Autowired
	private ReportMapper report_mapper;
	
	@Autowired
	private MemberMapper member_mapper;
	
	@GetMapping("/report/receive")
	public String report(HttpServletRequest request, Model model, HttpSession session) {
		
		int receiveMember = Integer.parseInt(request.getParameter("user"));
		
		MemberDTO member = member_mapper.getMember(receiveMember);
		
		model.addAttribute("receiveMember", receiveMember);
		model.addAttribute("member", member);
		
		return util.isLoginFilter(session, "/report/receive");
	}
	
	@PostMapping("/report/receive")
	public String report(HttpSession session, ReportDTO dto) {
		
		dto.setSend_user((Integer)session.getAttribute("num"));
		
		if(report_mapper.insertreport(dto) > 0) {
			return "/window/close";
		} else {
			return "/window/close";
		}
	}
	
}
