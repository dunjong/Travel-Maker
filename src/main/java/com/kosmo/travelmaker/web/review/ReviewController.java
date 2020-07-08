package com.kosmo.travelmaker.web.review;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.travelmaker.service.ReviewService;

@Controller
@RequestMapping("/TravelMaker/")
public class ReviewController {
	//서비스 주입]
	@Resource(name = "reviewService")
	private ReviewService reviewService;

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

	@RequestMapping("ReviewWriteOK.kosmo")
	public String ReviewWriteOK(@RequestParam Map map) {
		reviewService.insert(map);
		return "review/Review.tiles";
	}
}