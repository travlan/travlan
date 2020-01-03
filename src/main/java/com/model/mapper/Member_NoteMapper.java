package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.member.Member_NoteDTO;

public interface Member_NoteMapper{
	public int noteDelete(int send_user);
	public List<Member_NoteDTO> list(Map map);
	public List<Member_NoteDTO> getUserNotes(int num);
	public int sendNote(Member_NoteDTO dto);
	public int delete(int num);
	public Member_NoteDTO readNote(int num);
	public int readCheck(int num);
	public int unread(int num);
}