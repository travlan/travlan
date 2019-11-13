package com.model.post;

public class PostDTO {
	private int num;
	private int region_num;
	private String title;
	private String content;
	private String season;
	private String time;
	private String cost;
	private String type;
	
	public PostDTO() {
		super();
	}
	
	public PostDTO(int num, int region_num, String title, String content, String season, String time, String cost,
			String type) {
		super();
		this.num = num;
		this.region_num = region_num;
		this.title = title;
		this.content = content;
		this.season = season;
		this.time = time;
		this.cost = cost;
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "PostDTO [num=" + num + ", region_num=" + region_num + ", title=" + title + ", content=" + content
				+ ", season=" + season + ", time=" + time + ", cost=" + cost + ", type=" + type + "]";
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRegion_num() {
		return region_num;
	}
	public void setRegion_num(int region_num) {
		this.region_num = region_num;
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
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
