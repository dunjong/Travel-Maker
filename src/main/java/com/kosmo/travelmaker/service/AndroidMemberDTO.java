package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("androidMemberDTO")
public class AndroidMemberDTO {
	
	private String user_name;
	private String user_id;
	private String user_pwd;
	private String user_rrn;
	private String user_gender;
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_rrn() {
		return user_rrn;
	}
	public void setUser_rrn(String user_rrn) {
		this.user_rrn = user_rrn;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	@Override
	public String toString() {
		return "AndroidMemberDTO [user_name=" + user_name + ", user_id=" + user_id + ", user_pwd=" + user_pwd
				+ ", user_rrn=" + user_rrn + ", user_gender=" + user_gender + "]";
	}
	
	
}
