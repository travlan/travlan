package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.member.Member_NotifyDTO;

public interface Member_NotifyMapper{
	public int postnotify(int post_num);
	public int notifyDelete(int member_num);
	public List<Member_NotifyDTO> list(int member_num);
	public int create(Member_NotifyDTO dto);
	public int delete(int num);
	public int deleteAll(int member_num);
	public int read(int num);
}