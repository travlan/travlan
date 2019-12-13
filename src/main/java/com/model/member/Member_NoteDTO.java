package com.model.member;

public class Member_NoteDTO {
	private int num;
	private int send_user;
	private int revice_user;
	private String created_date;
	private String content;
	private String is_read;
	private String send_user_name;
	
	public Member_NoteDTO() {
		super();
	}
	public Member_NoteDTO(int num, int send_user, int revice_user, String created_date, String content, String is_read,
			String send_user_name) {
		super();
		this.num = num;
		this.send_user = send_user;
		this.revice_user = revice_user;
		this.created_date = created_date;
		this.content = content;
		this.is_read = is_read;
		this.send_user_name = send_user_name;
	}
	@Override
	public String toString() {
		return "Member_NoteDTO [num=" + num + ", send_user=" + send_user + ", revice_user=" + revice_user
				+ ", created_date=" + created_date + ", content=" + content + ", is_read=" + is_read
				+ ", send_user_name=" + send_user_name + "]";
	}
	
	public String getSend_user_name() {
		return send_user_name;
	}
	public void setSend_user_name(String send_user_name) {
		this.send_user_name = send_user_name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSend_user() {
		return send_user;
	}
	public void setSend_user(int send_user) {
		this.send_user = send_user;
	}
	public int getRevice_user() {
		return revice_user;
	}
	public void setRevice_user(int revice_user) {
		this.revice_user = revice_user;
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
