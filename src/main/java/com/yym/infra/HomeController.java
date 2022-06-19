package com.yym.infra;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/index/indexView")
	public String indexView() throws Exception {
		
		return "/index/indexView";
	}
	
}
