package com.model.post;

public class CommentDTO {
	private int num;
	private int post_num;
	private String member_num;
	private String title;
	private String content;
	private String score;
	private String created_date;
	private String updated_date;
	
	@Override
	public String toString() {
		return "CommentDTO [num=" + num + ", post_num=" + post_num + ", member_num=" + member_num + ", title=" + title
				+ ", content=" + content + ", score=" + score + ", created_date=" + created_date + ", updated_date="
				+ updated_date + "]";
	}

	public CommentDTO() {
		super();
	}
	
	public CommentDTO(int num, int post_num, String member_num, String title, String content, String score,
			String created_date, String updated_date) {
		super();
		this.num = num;
		this.post_num = post_num;
		this.member_num = member_num;
		this.title = title;
		this.content = content;
		this.score = score;
		this.created_date = created_date;
		this.updated_date = updated_date;
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
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
}
