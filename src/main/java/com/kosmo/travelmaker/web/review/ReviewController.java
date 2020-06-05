package com.kosmo.travelmaker.web.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/TravelMaker/")
public class ReviewController {

	@RequestMapping("ReviewView.kosmo")
	public String ReviewView() {
		return "review/ReviewView.tiles";
	}
	
	@RequestMapping("ReviewList.kosmo")
	public String ReviewList() {
		return "review/ReviewList.tiles";
	}
			
	@RequestMapping("ReviewSearch.kosmo")
	public String MyReview() {
		return "review/ReviewSearch.tiles";
	}
	
}