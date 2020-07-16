package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("countDTO")
public class CountDTO {
	private int count;
	private int city_no;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCity_no() {
		return city_no;
	}
	public void setCity_no(int city_no) {
		this.city_no = city_no;
	}
	
	
	
	
	
}
