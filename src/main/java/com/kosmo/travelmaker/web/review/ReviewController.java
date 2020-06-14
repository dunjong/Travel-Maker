package com.kosmo.travelmaker.web.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//리뷰 컨트롤러 여동준
@Controller
@RequestMapping("/TravelMaker/")
public class ReviewController {

	@RequestMapping("Review.kosmo")
	public String Review() {
		return "review/Review.tiles";
	}
	
	@RequestMapping("ReviewSearch.kosmo")
	public String ReviewSearch() {
		return "review/ReviewSearch.tiles";
	}
			
	@RequestMapping("ReviewWrite.kosmo")
	public String ReviewWrite() {
		return "review/ReviewWrite.tiles";
	}
	
}