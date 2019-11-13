package com.model.mapper;

import java.util.Map;

import com.model.member.MemberDTO;

public interface MemberMapper {
	public int create(MemberDTO dto);
	public int login(Map map);
}
