package com.kosmo.travelmaker;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.travelmaker.service.impl.PlannerServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Resource(name ="plannerService")
	private PlannerServiceImpl plannerService;
	
	@RequestMapping(value = "/")
	public String home(@RequestParam Map map,Model model,HttpSession session) {
		if(map.get("city_no")!=null)
			model.addAttribute("city_no",map.get("city_no"));
		
		String user_id="";
		if(session.getAttribute("id")!=null) {
			user_id=session.getAttribute("id").toString();
			List<Integer> planner_no_list= plannerService.selectPlannerNoListById(user_id);
			String planner_nos="";
			for(int planner_no:planner_no_list) {
				planner_nos+=","+planner_no;
			}
			if(planner_nos.length()!=0)
			planner_nos=planner_nos.substring(1);
			model.addAttribute("planner_nos", planner_nos);
		}
		
		return "home.tiles";
	}
	@RequestMapping(value = "/home.do",method = RequestMethod.POST)
	public String home2() {
		return "home.tiles";
	}
	
}
