package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.member.Member_ScrapDTO;

public interface Member_ScrapMapper{
	public int postscrap(int post_num);
	public int scrapDelete(int member_num);
	public int countScrap(int post_num);
	public Member_ScrapDTO scrapedPost(Map map);
	public int updateScrap(Map map);
	public int deleteScrap(Map map);
	public int scrap(Member_ScrapDTO dto);
	public List<Member_ScrapDTO> list(int member_num);
	public int checkScrap(Map map);
}