package com.kosmo.travelmaker.web.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.travelmaker.service.ReviewDTO;
import com.kosmo.travelmaker.service.ReviewService;

@Controller
@RequestMapping("/TravelMaker/")
public class ReviewController {
	//서비스 주입]
	@Resource(name = "reviewService")
	private ReviewService reviewService;

	@RequestMapping("Review.kosmo")
	public String Review(@RequestParam Map map,Model model) {
		//서비스 호출]
		ReviewDTO record=reviewService.selectOne(map);
		//데이타 저장]
		//줄바꿈 처리
		record.setReview_content(record.getReview_content().replace("\r\n", "<br/>"));
		model.addAttribute("record", record);
		//사진 임시 처리
		int tmpImgNo=(record.getReview_no())%4+1;
		System.out.println(tmpImgNo);
		model.addAttribute("tmpImgNo", tmpImgNo);
		//뷰정보 반환:
		return "review/Review.tiles";
	}

	@RequestMapping("ReviewSearch.kosmo")
	public String ReviewSearch(Model model) {
		List<ReviewDTO> list=reviewService.selectList();
		model.addAttribute("list", list);
		return "review/ReviewSearch.tiles";
	}

	@RequestMapping("ReviewWrite.kosmo")
	public String ReviewWrite() {
		return "review/ReviewWrite.tiles";
	}

	@RequestMapping("ReviewWriteOK.kosmo")
	public String ReviewWriteOK(@RequestParam Map map,Model model) {
		reviewService.insert(map);
		return "forward:/TravelMaker/ReviewSearch.kosmo";
	}
	@RequestMapping("ReviewEdit.kosmo")
	public String ReviewEdit(HttpServletRequest req,@RequestParam Map map) {
		//서비스 호출]
		ReviewDTO record=reviewService.selectOne(map);
		//데이타 저장]
		req.setAttribute("record", record);
		//수정 폼으로 이동]
		return "review/ReviewEdit.tiles";
	}

	@RequestMapping("ReviewEditOK.kosmo")
	public String ReviewEditOK(@RequestParam Map map) {
		reviewService.update(map);
		return "forward:/TravelMaker/Review.kosmo";
	}
	//삭제처리]
	@RequestMapping("ReviewDelete.kosmo")
	public String delete(@RequestParam Map map) {
		//서비스 호출
		reviewService.delete(map);
		//뷰정보 반환]
		return "forward:/TravelMaker/ReviewSearch.kosmo";
	}
	
}