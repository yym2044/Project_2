package com.yym.infra.modules.category;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDao {
	
	@Inject
//	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.yym.infra.modules.product.ProductMpp";
	
	public List<Category> selectCategory() {return sqlSession.selectList(namespace + ".selectCategory", ""); }

}
