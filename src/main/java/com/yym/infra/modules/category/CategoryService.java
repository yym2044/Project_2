package com.yym.infra.modules.category;

import java.util.List;

public interface CategoryService {

	public List<Category> selectCategoryNameString(CategoryVo vo) throws Exception;
	
}
