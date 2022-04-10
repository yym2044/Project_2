package com.yym.infra.modules.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CategoryController {

	@Autowired
	CategoryServiceImpl service;
	
	@ResponseBody
	@RequestMapping(value = "/category/categoryList")
	public List<Category> categoryList(@RequestParam("ifctParents") String ifctParents) throws Exception {
		
		List<Category> list = CategoryServiceImpl.selectCategoryWithParentsCachedCode(ifctParents);
		
		
		
		return list;
	}
}
