package com.yym.infra.modules.product;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
	
	@Inject
//	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.yym.infra.modules.product.ProductMpp";
	

}
