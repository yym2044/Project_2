package com.yym.infra.modules.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;

	@Override
	public List<Product> selectList(ProductVo vo) throws Exception {
		return dao.selectList(vo);
	}
	@Override
	public Integer selectListCount(ProductVo vo) throws Exception {
		return dao.selectListCount(vo);
	}

	@Override
	public Product selectOne(ProductVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	
	
}
