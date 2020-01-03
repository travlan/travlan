package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.member.MemberDTO;
import com.model.member.Member_InfoDTO;

public interface MemberMapper {
	public int checkMember(int num);
	public int infoDelete(int num);
	public Map getIdnPassword(String email);
	public int getEmail(String email);
	public int additionalchange(Member_InfoDTO dto);
	public int nicknamechange(Map map);
	public int create(MemberDTO dto);
	public int create_member_info(Member_InfoDTO dto);
	public int login(Map map);
	public int id_duplicate_check(String id);
	public int email_duplicate_check(String email);
	public int nickname_duplicate_check(String nickname);
	public String find_id(String email);
	public String find_passwd(Map map);
	public int get_unique_number(String id);
	public int passwd_check(Map map);
	public int passwd_change(Map map);
	public int is_info(String id);
	public List<Map<String, Object>> getRegion(String province);
	public MemberDTO getMember(int num);
	public Member_InfoDTO getMemberInfo(int num);
	public int secession(int num);
}
