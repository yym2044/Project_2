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
	public void selectCategoryForCache() {
		
		List<Category> categoryListFromDb = (ArrayList<Category>) dao.selectCategoryForCache();
		
		Category.cachedCategoryArrayList.clear();
		Category.cachedCategoryArrayList.addAll(categoryListFromDb);
		System.out.println("cachedCategoryArrayList : " + Category.cachedCategoryArrayList.size() + " catched!!");
		
	}
	public static List<Category> selectCategoryWithDepthCachedCode(String ifctDepth) throws Exception {
		
		List<Category> rt = new ArrayList<Category>();
		
		for(Category categoryRow : Category.cachedCategoryArrayList) {
			if(categoryRow.getIfctDepth().equals(ifctDepth)) {
				rt.add(categoryRow);
			} else {
				// by pass
			}
		}
		
		return rt;
	}
	
	public static List<Category> selectCategoryWithParentsCachedCode(String ifctParents) throws Exception {
		
		List<Category> rt = new ArrayList<Category>();
		
		for(Category categoryRow : Category.cachedCategoryArrayList) {
			if(categoryRow.getIfctParents().equals(ifctParents)) {
				rt.add(categoryRow);
			} else {
				// by pass
			}
		}
		
		return rt;
		
	}
	
	
	public static void clear() throws Exception {
		Category.cachedCategoryArrayList.clear();
	}
}
