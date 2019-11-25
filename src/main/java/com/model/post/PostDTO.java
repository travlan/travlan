package com.model.post;

public class PostDTO {
	private int post_num;
	private String title;
	private String content;
	private int region_num;
	private String season;
	private String time;
	private String cost;
	private String type;
	private String thumbnail;
	private String created_date;
	private String updated_date;
	private int member_num;
	
	public PostDTO() {
		super();
	}
	public PostDTO(int post_num, String title, String content, int region_num, String season, String time, String cost,
			String type, String thumbnail, String created_date, String updated_date, int member_num) {
		super();
		this.post_num = post_num;
		this.title = title;
		this.content = content;
		this.region_num = region_num;
		this.season = season;
		this.time = time;
		this.cost = cost;
		this.type = type;
		this.thumbnail = thumbnail;
		this.created_date = created_date;
		this.updated_date = updated_date;
		this.member_num = member_num;
	}
	@Override
	public String toString() {
		return "PostDTO [post_num=" + post_num + ", title=" + title + ", content=" + content + ", region_num="
				+ region_num + ", season=" + season + ", time=" + time + ", cost=" + cost + ", type=" + type
				+ ", thumbnail=" + thumbnail + ", created_date=" + created_date + ", updated_date=" + updated_date
				+ ", member_num=" + member_num + "]";
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
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
	public int getRegion_num() {
		return region_num;
	}
	public void setRegion_num(int region_num) {
		this.region_num = region_num;
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
}
