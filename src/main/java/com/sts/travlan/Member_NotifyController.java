package com.sts.travlan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.mapper.Member_NotifyMapper;
import com.model.member.Member_NotifyDTO;

@Controller
public class Member_NotifyController {
	
	Utility util = new Utility();
	
	@Autowired
	private Member_NotifyMapper mapper;
	
	@ResponseBody
	@GetMapping(value = "/user/notify", produces = "application/json;charset=utf-8")
	public Map<String, Object> getNotify(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("num") == null) {
			return map;
		}
		
		List<Member_NotifyDTO> list = mapper.list((Integer)session.getAttribute("num"));
		List<Map> content = new ArrayList();
		if(list.size() > 0) {
			map.put("count", list.size());
			for(int i=0; i<list.size(); i++) {
				Map element= new HashMap();
				element.put("num", list.get(i).getNum());
				element.put("post", list.get(i).getPost_num());
				element.put("detail", list.get(i).getContent());
				element.put("date", list.get(i).getCreated_date());
				content.add(element);
			}
			map.put("content", content);
		} else {
			map.put("count", "0");
		}
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("/user/notify/delete")
	public void deleteNotify(HttpSession session, int num) {
		
		mapper.delete(num);
	}
}