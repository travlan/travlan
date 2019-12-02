package com.model.mapper;

import java.util.List;
import java.util.Map;

import com.model.post.PostDTO;
import java.util.List;
import java.util.Map;

public interface PostMapper {
	public List<PostDTO> postList(int num);
	public int create(PostDTO dto);
	public PostDTO read(int num);
	public int update(PostDTO dto);
	public int secessionPost(int member_num);
	public int delete(int num);
	public List<PostDTO> list(Map map);
	public int total();
}