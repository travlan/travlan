package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.post.CommentDTO;

public interface CommentMapper {
	
	public List<CommentDTO> commentlist(int num);
}