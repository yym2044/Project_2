package com.yym.infra.modules.product;

import java.util.List;

public interface ProductService {

	public List<Product> selectList(ProductVo vo) throws Exception;
	public Integer selectListCount(ProductVo vo) throws Exception;
	public Product selectOne(ProductVo vo) throws Exception;
}
