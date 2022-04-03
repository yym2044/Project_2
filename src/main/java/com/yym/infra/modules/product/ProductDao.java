package com.yym.infra.modules.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
	
	@Inject
//	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.yym.infra.modules.product.ProductMpp";
	
	
	public List<Product> selectList(ProductVo vo) {return sqlSession.selectList(namespace + ".selectList", vo); }
	public Integer selectListCount(ProductVo vo) {return sqlSession.selectOne(namespace + ".selectListCount", vo); }
	
	public Product selectOne(ProductVo vo) {return sqlSession.selectOne(namespace + ".selectOne", vo); }
			
	

}
