package com.model.mapper;

import java.util.Map;

import com.model.member.MemberDTO;
import com.model.member.Member_InfoDTO;

public interface MemberMapper {
	public int create(MemberDTO dto);
	public int create_member_info(Member_InfoDTO dto);
	public int login(Map map);
	public int id_duplicate_check(String id);
	public int email_duplicate_check(String email);
	public int nickname_duplicate_check(String nickname);
	public String find_id(String email);
	public String find_passwd(Map map);
	public MemberDTO myinfo(String id);
	public int get_unique_number(String id);
	public int passwd_check(String id);
	public int passwd_change(Map map);
	public int is_info(String id);
}
