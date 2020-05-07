package com.kosmo.travelmaker.web.customerService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerServiceController {

	@RequestMapping("/TravelMaker/CustomerService.kosmo")
	public String CustomerService() {
		return "customerService/CustomerService.tiles";
	}
	
}
