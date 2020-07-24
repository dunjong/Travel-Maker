package com.kosmo.travelmaker.service;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository("chatDTO")
public class ChatDTO {
	private int chat_no;
	private int acc_no;
	private int planner_no;
	private Date chat_time;
	private String chat_text;
	private String user_id;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public int getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(int acc_no) {
		this.acc_no = acc_no;
	}
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	public Date getChat_time() {
		return chat_time;
	}
	public void setChat_time(Date chat_time) {
		this.chat_time = chat_time;
	}
	public String getChat_text() {
		return chat_text;
	}
	public void setChat_text(String chat_text) {
		this.chat_text = chat_text;
	}
	
	
	
}
