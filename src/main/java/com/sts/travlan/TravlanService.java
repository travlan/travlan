package com.sts.travlan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.mapper.CommentMapper;
import com.model.mapper.MemberMapper;
import com.model.mapper.Member_NoteMapper;
import com.model.mapper.Member_NotifyMapper;
import com.model.mapper.Member_ScrapMapper;
import com.model.mapper.PostMapper;
import com.model.mapper.ReportMapper;

@Service
public class TravlanService {
	
	@Autowired
	private PostMapper post_mapper;
	@Autowired
	private CommentMapper comment_mapper; 
	@Autowired
	private MemberMapper member_mapper;
	@Autowired
	private Member_NoteMapper note_mapper;
	@Autowired
	private Member_NotifyMapper notify_mapper;
	@Autowired
	private Member_ScrapMapper scrap_mapper;
	@Autowired
	private ReportMapper report_mapper;
	
	public void postdelete(int post_num) throws Exception {
		comment_mapper.allDelete(post_num);
		post_mapper.delete(post_num);
	}
	
	public void secessiondelete(int member_num) throws Exception {
		notify_mapper.notifyDelete(member_num);
		scrap_mapper.scrapDelete(member_num);
		note_mapper.noteDelete(member_num);
		report_mapper.reportDelete(member_num);
	}
	
	public void secessionupdate(int member_num) throws Exception {
		comment_mapper.commentUpdate(member_num);
		post_mapper.postUpdate(member_num);
	}
	
	public void secession(int member_num) throws Exception {
		member_mapper.infoDelete(member_num);
		member_mapper.secession(member_num);
	}
}
