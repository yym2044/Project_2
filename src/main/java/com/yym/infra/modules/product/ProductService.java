package com.yym.infra.modules.product;

import java.util.List;

public interface ProductService { 

	public List<Product> selectList(ProductVo vo) throws Exception;
	public Integer selectListCount(ProductVo vo) throws Exception;
	public List<Product> selectListCartGeneral(ProductVo vo) throws Exception;
	public int insertCartGeneral(Product dto) throws Exception;
	public int deleteCartGeneral(ProductVo vo) throws Exception;
	public Product selectOneMemberCheckOut(ProductVo vo) throws Exception;
	public List<Product> selectListShippingAddress(ProductVo vo) throws Exception;
	public Product selectOneShippingAddress(ProductVo vo) throws Exception;
	public int insertShippingAddress(Product dto) throws Exception;
	public int updateShippingAddress(Product dto) throws Exception;
	public int deleteShippingAddress(Product dto) throws Exception;
	public Product selectOne(ProductVo vo) throws Exception;
	public List<Product> selectListOptions(ProductVo vo) throws Exception;
	public List<Product> selectListUploaded(ProductVo vo) throws Exception;
	public Product selectOneProduct_Real(ProductVo vo) throws Exception;
	public List<Product> selectListWishList(ProductVo vo) throws Exception;
	public int insertWishList(ProductVo vo) throws Exception;
	public int deleteWishList(ProductVo vo) throws Exception;
	
	public int insertProduct(Product dto) throws Exception;
}
