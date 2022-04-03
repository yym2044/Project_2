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
	public List<Product> selectListOptions(ProductVo vo) {return sqlSession.selectList(namespace + ".selectListOptions", vo); }
			
	
//	//옵션값 메모리
//	public List<Product> optionParentForCache() {return sqlSession.selectList(namespace + ".optionParentForCache",""); }
//	public List<Product> optionChildForCache() {return sqlSession.selectList(namespace + ".optionChildForCache",""); }
	
}
