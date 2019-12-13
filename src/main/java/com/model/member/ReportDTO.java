package com.model.member;

public class ReportDTO {
	private int num;
	private int send_user;
	private int receive_user;
	private String content;
	private String created_date;
	
	public ReportDTO() {
		super();
	}
	
	public ReportDTO(int num, int send_user, int receive_user, String content, String created_date) {
		super();
		this.num = num;
		this.send_user = send_user;
		this.receive_user = receive_user;
		this.content = content;
		this.created_date = created_date;
	}
	
	@Override
	public String toString() {
		return "ReportDTO [num=" + num + ", send_user=" + send_user + ", receive_user=" + receive_user + ", content="
				+ content + ", created_date=" + created_date + "]";
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
	public int getReceive_user() {
		return receive_user;
	}
	public void setReceive_user(int receive_user) {
		this.receive_user = receive_user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
}
