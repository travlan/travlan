package com.model.member;

public class MemberDTO {
	private int num;
	private String grade;
	private String created_date;
	private String id;
	private String password;
	private String nickname;
	private String email;
	
	public MemberDTO() {
		super();
	}
	
	public MemberDTO(int num, String grade, String created_date, String id, String password, String nickname,
			String email) {
		super();
		this.num = num;
		this.grade = grade;
		this.created_date = created_date;
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [num=" + num + ", grade=" + grade + ", created_date=" + created_date + ", id=" + id
				+ ", password=" + password + ", nickname=" + nickname + ", email=" + email + "]";
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
