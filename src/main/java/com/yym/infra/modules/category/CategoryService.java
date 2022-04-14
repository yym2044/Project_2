package com.yym.infra.modules.category;

import java.util.List;

public interface CategoryService {

	public List<Category> selectCategoryNameString() throws Exception;
	public Category selectOneifctSeqString(CategoryVo vo) throws Exception;
	
}
