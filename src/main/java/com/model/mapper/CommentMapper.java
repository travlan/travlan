package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.post.CommentDTO;

public interface CommentMapper {
	public int commentUpdate(int member_num);
	public int allDelete(int post_num);
	public List<CommentDTO> commentlist(int num);
	public List<CommentDTO> list(int num);
	public CommentDTO highestRate(int post_num);
	public CommentDTO lowestRate(int post_num);
	public int mycomment(int member_num);
	public int total(int post_num);
	public int create(CommentDTO dto);
	public int deleteVerifing(Map map);
	public int delete(int num);
	public int update(CommentDTO dto);
	public int totalRate(int post_num);
}