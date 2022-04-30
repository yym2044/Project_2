package com.yym.infra;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/index")
	public String index() {
		return "/index";
	}
	
	@RequestMapping(value = "/login/loginForm")
	public String loginForm() {
		
		return "/login/loginForm";
	}
	
	@RequestMapping(value = "/login/loginFindId")
	public String loginFindId() {
		
		return "/login/loginFindId";
	}
	@RequestMapping(value = "/login/loginFindPwd")
	public String loginFindPwd() {
		
		return "/login/loginFindPwd";
	}
	@RequestMapping(value = "/login/regForm1")
	public String regForm1() {
		
		return "/login/regForm1";
	}
	@RequestMapping(value = "/login/regForm2")
	public String regForm2() {
		
		return "/login/regForm2";
	}
	
}
