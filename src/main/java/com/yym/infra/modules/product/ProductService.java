package com.yym.infra.modules.product;

import java.util.List;

public interface ProductService { 

	public List<Product> selectList(ProductVo vo) throws Exception;
	public Integer selectListCount(ProductVo vo) throws Exception;
	public List<Product> selectListCartGeneral(ProductVo vo) throws Exception;
	public int insertCartGeneral(Product dto) throws Exception;
	public Product selectOne(ProductVo vo) throws Exception;
	public List<Product> selectListOptions(ProductVo vo) throws Exception;
	public List<Product> selectListUploaded(ProductVo vo) throws Exception;
	public Product selectOneProduct_Real(ProductVo vo) throws Exception;
	
	public int insertProduct(Product dto) throws Exception;
}
