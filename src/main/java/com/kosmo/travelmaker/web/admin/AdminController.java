package com.kosmo.travelmaker.web.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/TravelMaker/")
public class AdminController {
	
	
@Value("${GoogleMapApiKey}")
private String GoogleMapApiKey;
	
	
@RequestMapping("admin1.kosmo")
	public String admin1() {
	return "AdminLTE/admin1";
}
@RequestMapping("admin2.kosmo")
public String admin2() {
return "AdminLTE/admin2";
}
@RequestMapping("adminCity.kosmo")
public String adminCity(Model model) {

model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
return "AdminLTE/adminCity";
}
@RequestMapping(value="SaveAutoSpots.kosmo", produces ="text/html; charset=UTF-8")
@ResponseBody
public String SaveAutoSpots(@RequestParam Map map) {
	String city_name=map.get("city_name").toString();
	int auto_plan_date=Integer.parseInt(map.get("auto_plan_date").toString());
	String spot_name=map.get("spot_name").toString();
	
	
return "AdminLTE/adminCity";
}




}

