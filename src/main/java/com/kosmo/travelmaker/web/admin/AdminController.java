package com.kosmo.travelmaker.web.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.travelmaker.service.Adminservice;
import com.kosmo.travelmaker.service.MemberDTO;
import com.kosmo.travelmaker.service.ReviewDTO;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class AdminController {
	// 멤버서비스 주입
	@Resource(name = "memberService")
	private MemberServiceImpl memberService;

	@Value("${GoogleMapApiKey}")
	private String GoogleMapApiKey;

	@RequestMapping("admin1.kosmo")
	public String admin1() {
		return "AdminLTE/admin1";
	}

	@RequestMapping("admin2.kosmo")
	public String admin2(Model model) {
		List<MemberDTO> list = memberService.selectMemberList();
		model.addAttribute("list", list);
		return "AdminLTE/admin2";
	}

	@RequestMapping("adminCity.kosmo")
	public String adminCity(Model model) {

		model.addAttribute("GoogleMapApiKey", GoogleMapApiKey);
		return "AdminLTE/adminCity";
	}

	@RequestMapping(value = "SaveAutoSpots.kosmo", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String SaveAutoSpots(@RequestParam Map map) {
		String city_name = map.get("city_name").toString();
		int auto_plan_date = Integer.parseInt(map.get("auto_plan_date").toString());
		String spot_name = map.get("spot_name").toString();

		return "AdminLTE/adminCity";
	}

//관리자로 로그인 후에 강제 탈퇴시킬 회원의 아이디를 입력후 강제탈퇴 버튼을 누르면 연결되는 메소드
	@RequestMapping("/admin/admin_member_forced_eviction.do")
	public ModelAndView admin_member_forced_eviction(String user_id) throws Exception {

		// 유저의 아이디를 삭제 (강제탈퇴) 시키기위해서 dto에 담는다.
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(user_id);

		// 회원탈퇴 체크를 하기위한 메소드, 탈퇴 시키려는 회원의 아이디가 있는지 검사한후에 result 변수에 저장한다.
		Adminservice.admin_member_forced_evictionCheck(dto);

		ModelAndView mav = new ModelAndView();

		if (dto.getUser_id() != null) { // 회원 강제탈퇴가 성공했을시 출력되는 뷰

			mav.setViewName("home");

			mav.addObject("message", "회원이 정상적으로 강제탈퇴 처리 되었습니다.");

		}
		return mav;

	}

}
