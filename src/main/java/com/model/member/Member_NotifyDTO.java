package com.model.member;

public class Member_NotifyDTO {
	private int num;
	private int member_num;
	private int post_num;
	private String created_date;
	private String content;
	private String is_read;
	
	public Member_NotifyDTO() {
		super();
	}
	
	public Member_NotifyDTO(int num, int member_num, int post_num, String created_date, String content,
			String is_read) {
		super();
		this.num = num;
		this.member_num = member_num;
		this.post_num = post_num;
		this.created_date = created_date;
		this.content = content;
		this.is_read = is_read;
	}
	
	@Override
	public String toString() {
		return "Member_NotifyDTO [num=" + num + ", member_num=" + member_num + ", post_num=" + post_num
				+ ", created_date=" + created_date + ", content=" + content + ", is_read=" + is_read + "]";
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIs_read() {
		return is_read;
	}
	public void setIs_read(String is_read) {
		this.is_read = is_read;
	}
	
}
