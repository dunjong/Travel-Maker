package com.kosmo.travelmaker.android;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.travelmaker.service.AndroidCityDTO;
import com.kosmo.travelmaker.service.AndroidMemberDTO;
import com.kosmo.travelmaker.service.impl.AndroidServiceImpl;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;

@RestController
@RequestMapping("/android")
public class androidController {
	@Resource(name="memberService")
	private MemberServiceImpl service;
	
	@Resource(name="androidService")
	private AndroidServiceImpl androidservice;
	
//	,produces ="text/html; charset=UTF-8"
	@CrossOrigin
	@GetMapping(value="/member/json")
	public AndroidMemberDTO isMemberJsonByGet(AndroidMemberDTO member) {		
		System.out.println(member.toString());
		AndroidMemberDTO dto=service.isLogin(member);
		System.out.println(dto.toString());
		return dto;		
	}
	
	@CrossOrigin
	@GetMapping(value="/membercheck/json")
	public String isMemberCheck(@RequestParam String id) {
		System.out.println(id);
		String check = service.idCheck(id);
		System.out.println(check);
		return check;
	}
	
	@CrossOrigin
	@GetMapping(value="/register/json")
	public String registerInsert(AndroidMemberDTO member) {
		System.out.println(member.toString());
		int i = service.registerInsert(member);
		String value=null;
		System.out.println(i);
		if(i==1) {
			value="success";
		}
		return value;
	}
	
	@CrossOrigin
	@GetMapping(value="/planname/json")
	public String plannameGet(@RequestParam String user_id) {
		System.out.println(user_id);
		/* Map map = new HashMap(); */
		JSONArray ja = new JSONArray();
		List<String> plannames = androidservice.plannameGet(user_id);
		
		/* List<Map> plans= new Vector<Map>(); */
		for(int i=0;i<plannames.size();i++) {
			ja.add(plannames.get(i));
			/*
			 * System.out.println(planname); map.put("planname",planname); plans.add(map);
			 */
		}
		return ja.toJSONString();
	}
	
	@CrossOrigin
	@GetMapping(value="/plandetail/json",produces = "text/html; charset=UTF-8")
	public String planGet(@RequestParam String planname) {
		System.out.println(planname);
		
		List<AndroidCityDTO> list=androidservice.planCityGet(planname);
		for(int i=0;i<list.size();i++) {
			AndroidCityDTO dto =list.get(i);
			String[] dates=dto.getCities_date().split(",");
			String date1=dates[1];
			String date2=dates[0];
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
	        try {
				Date FirstDate = format.parse(date1);
				Date SecondDate = format.parse(date2);
				long calDate = FirstDate.getTime() - SecondDate.getTime(); 
				long calDateDays = calDate / ( 24*60*60*1000);
				calDateDays = Math.abs(calDateDays);
				System.out.println("두 날짜의 날짜 차이: "+calDateDays);
				System.out.println("도시이름:"+dto.getCity_name());
				int totalD=(int)calDateDays+1;
				String totalDate=Integer.toString(totalD);
				dto.setCities_date(totalDate);
			} 
	        catch (ParseException e) {e.printStackTrace();}
		}
		return net.sf.json.JSONArray.fromObject(list).toString();
	}
	
	
}
