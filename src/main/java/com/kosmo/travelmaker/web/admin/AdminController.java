package com.kosmo.travelmaker.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/TravelMaker/")
public class AdminController {
@RequestMapping("admin1.kosmo")
	public String admin1() {
	return "AdminLTE/admin1";
}
@RequestMapping("admin2.kosmo")
public String admin2() {
return "AdminLTE/admin2";
}
}
