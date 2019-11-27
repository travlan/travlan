package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.post.PostDTO;
import java.util.List;
import java.util.Map;

public interface PostMapper {
	public int create(PostDTO dto);
	public PostDTO read(int num);
	public int update(PostDTO dto);
	public int delete(int num);
	public List<PostDTO> list(Map map);
	public int total();
}
