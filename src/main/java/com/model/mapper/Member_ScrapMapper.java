package com.model.mapper;

import java.util.List;

import com.model.member.Member_ScrapDTO;

public interface Member_ScrapMapper{
	public Member_ScrapDTO list();
	public List scrapPost(int member_num);
	public int scrap(Member_ScrapDTO dto);
}