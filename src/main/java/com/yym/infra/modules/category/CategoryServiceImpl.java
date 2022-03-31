package com.yym.infra.modules.category;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl {

	@Autowired
	CategoryDao dao;
	
	
	@PostConstruct
	public void selectCategoryForCache(){
		
		List<Category> categoryListFromDb = (ArrayList<Category>) dao.selectCategoryForCache();
		
		Category.cachedCategoryArrayList.clear();
		Category.cachedCategoryArrayList.addAll(categoryListFromDb);
		System.out.println("cachedCategoryArrayList: " + Category.cachedCategoryArrayList.size() + " catched !!");
	}
	
}
