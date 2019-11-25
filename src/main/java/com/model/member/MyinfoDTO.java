package com.model.member;

public class MyinfoDTO {
	private int num;
	private String nickname;
	private String email;
	private String age;
	private String type;
	private String gender;
	private String region;
	
	public MyinfoDTO() {
		super();
	}
	public MyinfoDTO(int num, String nickname, String email, String age, String type, String gender, String region) {
		super();
		this.num = num;
		this.nickname = nickname;
		this.email = email;
		this.age = age;
		this.type = type;
		this.gender = gender;
		this.region = region;
	}
	@Override
	public String toString() {
		return "MyinfoDTO [num=" + num + ", nickname=" + nickname + ", email=" + email + ", age=" + age + ", type=" + type + ", gender="
				+ gender + ", region=" + region + "]";
	}
	public int getNum(){
		return num;
	}
	public void setNum(int num){
		this.num = num;
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}

}
