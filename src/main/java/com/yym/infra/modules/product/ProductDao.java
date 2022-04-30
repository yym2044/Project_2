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
	
	public List<Product> selectListCartGeneral(ProductVo vo) {return sqlSession.selectList(namespace + ".selectListCartGeneral", vo); }
	public int insertCartGeneral(Product dto) {return sqlSession.insert(namespace + ".insertCartGeneral", dto); }
	public int deleteCartGeneral(ProductVo vo) {return sqlSession.delete(namespace + ".deleteCartGeneral", vo); }
	public Product selectOneMemberCheckOut(ProductVo vo) {return sqlSession.selectOne(namespace + ".selectOneMemberCheckOut", vo); }
	public List<Product> selectListMemberAddress(ProductVo vo) {return sqlSession.selectList(namespace + ".selectListMemberAddress", vo); }
	
	public Product selectOne(ProductVo vo) {return sqlSession.selectOne(namespace + ".selectOne", vo); }
	public List<Product> selectListOptions(ProductVo vo) {return sqlSession.selectList(namespace + ".selectListOptions", vo); }
	public List<Product> selectListUploaded(ProductVo vo) {return sqlSession.selectList(namespace + ".selectListUploaded", vo); }
	public Product selectOneProduct_Real(ProductVo vo) {return sqlSession.selectOne(namespace + ".selectOneProduct_Real", vo); }
			
	
//	//옵션값 메모리
//	public List<Product> optionParentForCache() {return sqlSession.selectList(namespace + ".optionParentForCache",""); }
//	public List<Product> optionChildForCache() {return sqlSession.selectList(namespace + ".optionChildForCache",""); }
	
	
	public int insertProduct(Product dto) {return sqlSession.insert(namespace + ".insertProduct", dto); }
	public int insertOptionParent(Product dto) {return sqlSession.insert(namespace + ".insertOptionParent", dto); }
	public int updateOptionParentCd(Product dto) {return sqlSession.update(namespace + ".updateOptionParentCd", dto); }
	public int insertOptionChild(Product dto) {return sqlSession.insert(namespace + ".insertOptionChild", dto); }
	public int insertProductUploaded(Product dto) {return sqlSession.insert(namespace + ".insertProductUploaded", dto); } 
	public int insertProduct_Real(Product dto) {return sqlSession.insert(namespace + ".insertProduct_Real", dto); }
	
	
	public List<Product> selectListWishList(ProductVo vo) {return sqlSession.selectList(namespace + ".selectListWishList", vo);}
	public int insertWishList(ProductVo vo) {return sqlSession.insert(namespace + ".insertWishList", vo); }
	public int deleteWishList(ProductVo vo) {return sqlSession.insert(namespace + ".deleteWishList", vo); }
	
}
