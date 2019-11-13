package com.model.member;

public class Member_ScrapDTO {
	private int num;
	private int member_num;
	private int post_num;
	private String memo;
	
	public Member_ScrapDTO() {
		super();
	}
	
	public Member_ScrapDTO(int num, int member_num, int post_num, String memo) {
		super();
		this.num = num;
		this.member_num = member_num;
		this.post_num = post_num;
		this.memo = memo;
	}
	
	@Override
	public String toString() {
		return "Member_ScrapDTO [num=" + num + ", member_num=" + member_num + ", post_num=" + post_num + ", memo="
				+ memo + "]";
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	

}
