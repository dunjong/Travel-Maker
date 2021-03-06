package com.kosmo.travelmaker.web.review;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.travelmaker.service.ReviewPagingUtil;
import com.kosmo.travelmaker.service.CityService;
import com.kosmo.travelmaker.service.CityTagService;
import com.kosmo.travelmaker.service.ReviewDTO;
import com.kosmo.travelmaker.service.ReviewService;
import com.kosmo.travelmaker.service.impl.CityServiceImpl;
import com.kosmo.travelmaker.service.impl.ReviewServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class ReviewController {
	// 서비스 주입]
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	@Resource (name="cityService")
	private CityServiceImpl cityService;
	
	@RequestMapping("Review.kosmo")
	public String Review(@RequestParam Map map, Model model,HttpSession session) {
		// 서비스 호출]
		ReviewDTO record = reviewService.selectOne(map);
		String user_id=session.getAttribute("id").toString();
		// 데이타 저장]
		String review_no=map.get("review_no").toString();
		Map<String, String> maps=new HashMap<String, String>();
		maps.put("user_id", user_id);
		maps.put("review_no", review_no);
		maps.put("re_hateno", "1");
		int likeCount=reviewService.likeSelect(maps);
		if(reviewService.selectLikeByIdReviewNo(maps)) {
			record.setFlagLikeById(1);
		}
		record.setLike(likeCount);
		maps=new HashMap<String, String>();
		maps.put("user_id", user_id);
		maps.put("review_no", review_no);
		maps.put("re_hateno", "0");
		likeCount=reviewService.likeSelect(maps);
		if(reviewService.selectLikeByIdReviewNo(maps)) {
			record.setFlagHateById(1);
		}
		record.setHate(likeCount);
		
		
		// 줄바꿈 처리
		record.setReview_content(record.getReview_content().replace("\r\n", "<br/>"));
		System.out.println("userID:"+record.getUser_id());
		model.addAttribute("record", record);
		// 사진 임시 처리
		int tmpImgNo = (record.getReview_no()) % 4 + 1;
		System.out.println(tmpImgNo);
		model.addAttribute("tmpImgNo", tmpImgNo);
		model.addAttribute("user_id",session.getAttribute("id").toString());
		// 뷰정보 반환:
		return "review/Review.tiles";
	}

	private int pageSize = 4;
	private int blockPage = 3;

	@RequestMapping("ReviewSearch.kosmo")
	public String ReviewSearch(@RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage,
		
		HttpServletRequest req, Model model, HttpSession session) {
		
		int totalRecordCount = reviewService.getTotalRecord(map);
		// 전체 페이지수]
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

		// 시작 및 끝 ROWNUM구하기]
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		// 페이징을 위한 로직 끝]
		map.put("start", start);
		map.put("end", end);
		List<ReviewDTO> list = reviewService.selectList(map);
		for(ReviewDTO review_dto:list) {
			String review_no=Integer.toString(review_dto.getReview_no());
			Map<String, String> maps=new HashMap<String, String>();
			maps.put("review_no", review_no);
			maps.put("re_hateno", "1");
			int likeCount=reviewService.likeSelect(maps);
			review_dto.setLike(likeCount);
			maps=new HashMap<String, String>();
			maps.put("review_no", review_no);
			maps.put("re_hateno", "0");
			likeCount=reviewService.likeSelect(maps);
			review_dto.setHate(likeCount);
		}
		
		
		
		
		String pagingString = ReviewPagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
		req.getContextPath() + "/TravelMaker/ReviewSearch.kosmo?");
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		return "review/ReviewSearch.tiles";
	}

	@RequestMapping("ReviewWrite.kosmo")
	public String ReviewWrite() {
		return "review/ReviewWrite.tiles";
	}
	@RequestMapping(value="ReviewWriteOK.kosmo",method=RequestMethod.POST)
	public String ReviewWriteOK(@RequestParam Map map, @RequestParam("review_file_real") MultipartFile file,HttpServletRequest req,HttpSession session) throws IOException {
		String user_id=session.getAttribute("id").toString();
		if(user_id!=null) {
		map.put("user_id", user_id);	
		System.out.println("reviewFile:"+map.get("review_file"));
		
		reviewService.insert(map);
		String path=req.getSession().getServletContext().getRealPath("/resources/ReviewUpload");
		System.out.println("path:"+path);
		File f = new File(path+File.separator+file.getOriginalFilename());
		String fileName = path+File.separator+file.getOriginalFilename();
		System.out.println(f);
		
		System.out.println(fileName);
		file.transferTo(f);
		try {
		
		}
		catch(IllegalStateException e) {
			e.printStackTrace();
		}

		return "forward:/TravelMaker/ReviewSearch.kosmo";
		}
		else {
		return "forward:/TravelMaker/ReviewWrite.kosmo";
		}
	}

	@RequestMapping("ReviewEdit.kosmo")
	public String ReviewEdit(HttpServletRequest req, @RequestParam Map map) {
		// 서비스 호출]
		ReviewDTO record = reviewService.selectOne(map);
		// 데이타 저장]
		req.setAttribute("record", record);
		// 수정 폼으로 이동]
		return "review/ReviewEdit.tiles";
	}
	
	
	@RequestMapping(value="/TravelMaker/ReviewEditOK.kosmo")
	public String ReviewEditOK(@RequestParam Map map){
		reviewService.update(map);
		return "forward:/TravelMaker/Review.kosmo";
	}

	// 삭제처리]
	@RequestMapping("ReviewDelete.kosmo")
	public String delete(@RequestParam Map map) {
		// 서비스 호출		
		reviewService.deleteAllLike(map);
		reviewService.delete(map);
		// 뷰정보 반환]
		return "forward:/TravelMaker/ReviewSearch.kosmo";
	}
	@RequestMapping(value ="/TravelMaker/getcityno.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String getcityno(@RequestParam String city_name){
		
		
		return Integer.toString(cityService.selectCityNo(city_name));
	}
	@ResponseBody
	@RequestMapping(value="ReviewLike.kosmo",produces ="text/html; charset=UTF-8")
	public String Likeinsert(@RequestParam Map map,HttpSession session) {
		String re_hateno=map.get("likeNo").toString();
		String review_no=map.get("review_no").toString();
		String user_id=session.getAttribute("id").toString();
		String flag="";
		System.out.println("review_hateno:"+re_hateno+"review_no:"+review_no);
		Map<String, String> maps=new HashMap<String, String>();
		maps.put("user_id", user_id);
		maps.put("review_no", review_no);
		maps.put("re_hateno", re_hateno);
		
		if(reviewService.selectLikeByIdReviewNo(maps)) {
			if(reviewService.Likeinsert(maps)) {
				flag="like 생성 성공";
				System.out.println("like 생성 성공");
			};
		}
		else {
			if(re_hateno=="0") {
				if(reviewService.deleteLike(maps)) {
					flag="이미 싫어요를 누른 아이디입니다";
				};
				
			}
			else {
				if(reviewService.deleteLike(maps)) {
					flag="이미 좋아요를 누른 아이디입니다";
				}
			}
		}
		return flag;
	}
	
	
	

}