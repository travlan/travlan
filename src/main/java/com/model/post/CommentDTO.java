package com.model.post;

public class CommentDTO {
	private int num;
	private int post_num;
	private String member_num;
	private String title;
	private String content;
	private int score;
	private String created_date;
	private String updated_date;
	private String thumbnail;
	private String posttitle;
	private String nickname;
	
	@Override
	public String toString() {
		return "CommentDTO [num=" + num + ", post_num=" + post_num + ", member_num=" + member_num + ", title=" + title
				+ ", content=" + content + ", score=" + score + ", created_date=" + created_date + ", updated_date="
				+ updated_date + ", thumbnail=" + thumbnail + ", posttitle=" + posttitle + ", nickname=" + nickname
				+ "]";
	}

	public CommentDTO() {
		super();
	}
	
	public CommentDTO(int num, int post_num, String member_num, String title, String content, int score,
			String created_date, String updated_date, String thumbnail, String posttitle, String nickname) {
		super();
		this.num = num;
		this.post_num = post_num;
		this.member_num = member_num;
		this.title = title;
		this.content = content;
		this.score = score;
		this.created_date = created_date;
		this.updated_date = updated_date;
		this.thumbnail = thumbnail;
		this.posttitle = posttitle;
		this.nickname = nickname;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getMember_num() {
		return member_num;
	}
	public void setMember_num(String member_num) {
		this.member_num = member_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getPosttitle() {
		return posttitle;
	}
	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
