package com.model.member;

public class Member_InfoDTO {
	private int num;
	private String age;
	private String type;
	private String gender;
	private int region_num;
	
	public Member_InfoDTO() {
		super();
	}
	
	public Member_InfoDTO(int num, String age, String type, String gender, int region_num) {
		super();
		this.num = num;
		this.age = age;
		this.type = type;
		this.gender = gender;
		this.region_num = region_num;
	}
	
	@Override
	public String toString() {
		return "Member_InfoDTO [num=" + num + ", age=" + age + ", type=" + type + ", gender=" + gender + ", region_num="
				+ region_num + "]";
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getRegion_num() {
		return region_num;
	}
	public void setRegion_num(int region_num) {
		this.region_num = region_num;
	}
	
}
