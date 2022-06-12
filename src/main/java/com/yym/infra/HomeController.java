package com.yym.infra;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/index")
	public String index() {
		return "/index";
	}
	
	@RequestMapping(value = "/meeting")
	public String meeting() {
		return "/meeting";
	}
	
}
