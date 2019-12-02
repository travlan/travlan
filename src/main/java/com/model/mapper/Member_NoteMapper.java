package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.member.Member_NoteDTO;

public interface Member_NoteMapper{
	public List<Member_NoteDTO> list(Map map);
	public List<Member_NoteDTO> getUserNotes(int num);
	public int sendNote(Member_NoteDTO dto);
	public Member_NoteDTO readNote(int num);
}