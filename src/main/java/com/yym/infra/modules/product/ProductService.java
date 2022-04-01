package com.yym.infra.modules.product;

import java.util.List;

public interface ProductService {

	public List<Product> selectList(ProductVo vo) throws Exception;
	
}
