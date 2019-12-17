package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.member.Member_NotifyDTO;

public interface Member_NotifyMapper{
	public List<Member_NotifyDTO> list(int member_num);
	public int create(Member_NotifyDTO dto);
	public int delete(int num);
	public int read(int num);
}