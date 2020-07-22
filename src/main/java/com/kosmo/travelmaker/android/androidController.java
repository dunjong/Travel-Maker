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
import com.kosmo.travelmaker.service.AndroidCountryDTO;
import com.kosmo.travelmaker.service.AndroidFestivalDTO;
import com.kosmo.travelmaker.service.AndroidFestivalNameDTO;
import com.kosmo.travelmaker.service.AndroidMemberDTO;
import com.kosmo.travelmaker.service.AndroidPlanDTO;
import com.kosmo.travelmaker.service.AndroidSpotDTO;
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
	@GetMapping(value="/planname/json",produces = "text/html; charset=UTF-8")
	public String plannameGet(@RequestParam String user_id) {
		System.out.println(user_id);
		/* Map map = new HashMap(); */
		List<AndroidPlanDTO> list = androidservice.plannameGet(user_id);
		
		return net.sf.json.JSONArray.fromObject(list).toString();
	}
	
	
	@CrossOrigin
	@GetMapping(value="/country/json",produces = "text/html; charset=UTF-8")
	public String festivalCountry() {
		
		List<AndroidCountryDTO> countries=androidservice.selectCountry();
		
		return net.sf.json.JSONArray.fromObject(countries).toString();
	}
	
	
	@CrossOrigin
	@GetMapping(value="/festivalname/json",produces = "text/html; charset=UTF-8")
	public String festivalName(@RequestParam String festival_country) {
		
		List<AndroidFestivalNameDTO> names=androidservice.selectFestivalName(festival_country);
		
		return net.sf.json.JSONArray.fromObject(names).toString();
	}
	
	
	
	@CrossOrigin
	@GetMapping(value="/festival/json",produces = "text/html; charset=UTF-8")
	public String festival(@RequestParam String festival_name) {
		
		AndroidFestivalDTO festival=androidservice.selectFestival(festival_name);
		
		return net.sf.json.JSONObject.fromObject(festival).toString();
	}
	
	
	
	@CrossOrigin
	@GetMapping(value="/plandetail/json",produces = "text/html; charset=UTF-8")
	public String planGet(@RequestParam String planno) {
		System.out.println(planno);
		
		List<AndroidCityDTO> list=androidservice.planCityGet(planno);
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
	
	
	
	@CrossOrigin
	@GetMapping(value="/placemarker/json",produces = "text/html; charset=UTF-8")
	public String placeMarker(@RequestParam Map map) {
		String city_name=map.get("city_name").toString();
		String city_plan_date=map.get("city_plan_date").toString();
		String planno=map.get("planno").toString();
		System.out.println("도시이름:"+city_name);
		System.out.println("도시일수:"+city_plan_date);
		System.out.println("도시플랜이름:"+planno);
		Map citymap = new HashMap();
		citymap.put("city_name", city_name);
		citymap.put("city_plan_date",city_plan_date);
		citymap.put("planno", planno);
		List<AndroidSpotDTO> spots=androidservice.getSpot(citymap);
		List<Map> list = new Vector<Map>();
		for(AndroidSpotDTO spot:spots) {
			System.out.println(spot.getSpot_latlng());
			String[] latlng=spot.getSpot_latlng().split(",");
			System.out.println(latlng[0]);
			String lat = latlng[0];
			String lng = latlng[1];
			String title = spot.getSpot_name();
			Map map2 = new HashMap();
			map2.put("lat", lat);
			map2.put("lng", lng);
			map2.put("title", title);
			list.add(map2);
			System.out.println(latlng[1]);
			System.out.println(spot.getSpot_name());
		}
		
		
		return net.sf.json.JSONArray.fromObject(list).toString();
	}
	
	
}
