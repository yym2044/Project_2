package com.yym.infra.modules.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl {

	@Autowired
	CategoryDao dao;
	
}
