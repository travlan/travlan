package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.post.CommentDTO;

public interface CommentMapper {
	
	public List<CommentDTO> commentlist(int num);
	public List<CommentDTO> list(Map map);
	public CommentDTO highestRate(int post_num);
	public CommentDTO lowestRate(int post_num);
	public int total(int post_num);
}