package com.yym.infra;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/home")
	public String home(Model model) {
		
		return "/home";
	}
	
	@RequestMapping(value = "/login/loginForm")
	public String loginForm() {
		
		return "/login/loginForm";
	}
	
}
