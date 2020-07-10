package com.kosmo.travelmaker.service;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository("reviewDTO")
public class ReviewDTO {
	private int review_no;
	private String user_id;
	private int spot_no;
	private String review_title;
	private String review_content;
	private Date review_date;
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getSpot_no() {
		return spot_no;
	}
	public void setSpot_no(int spot_no) {
		this.spot_no = spot_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
}
