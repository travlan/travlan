package com.sts.travlan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.mapper.CommentMapper;
import com.model.mapper.PostMapper;

@Service
public class TravlanService {
	
	@Autowired
	private PostMapper post_mapper;
	@Autowired
	private CommentMapper comment_mapper;
	
	public void postdelete(int post_num) throws Exception {
		comment_mapper.allDelete(post_num);
		post_mapper.delete(post_num);
	}
}
