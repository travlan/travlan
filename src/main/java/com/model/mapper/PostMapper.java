package com.model.mapper;

import com.model.post.PostDTO;

public interface PostMapper {
	public int create(PostDTO dto);
	public PostDTO read(int num);
	public int update(PostDTO dto);
	public int delete(int num);
}
