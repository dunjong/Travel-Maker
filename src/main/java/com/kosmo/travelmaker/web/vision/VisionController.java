package com.kosmo.travelmaker.web.vision;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VisionController {

	@RequestMapping("/TravelMaker/Vision.kosmo")
	public String Vision() {
		return "vision/Vision.tiles";
	}
	
}
