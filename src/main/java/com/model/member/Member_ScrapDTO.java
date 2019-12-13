package com.model.member;

public class Member_ScrapDTO {
	private int num;
	private int member_num;
	private int post_num;
	private String memo;
	private String created_date;
	private String nickname;
	private String thumbnail;
	private String title;
	
	public Member_ScrapDTO() {
		super();
	}
	
	public Member_ScrapDTO(int num, int member_num, int post_num, String memo, String created_date, String nickname, String thumbnail, String title) {
		super();
		this.num = num;
		this.member_num = member_num;
		this.post_num = post_num;
		this.memo = memo;
		this.created_date = created_date;
		this.nickname = nickname;
		this.thumbnail = thumbnail;
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "Member_ScrapDTO [num=" + num + ", member_num=" + member_num + ", post_num=" + post_num + ", memo="
				+ memo + ", created_date=" + created_date + ", nickname=" + nickname + ", thumbnail=" + thumbnail + ", title=" + title + "]";
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date() {
		this.created_date = created_date;
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
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
