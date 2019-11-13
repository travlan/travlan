package com.model.mapper;

import java.util.Map;

import com.model.member.MemberDTO;
import com.model.member.Member_InfoDTO;

public interface MemberMapper {
	public int create(MemberDTO dto);
	public int create_member_info(Member_InfoDTO dto);
	public int login(Map map);
}
