package com.yym.infra.modules.product;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl {

	@Autowired
	ProductDao dao;
	
	@PostConstruct
	public void selectListForCache(){
		
		
		
	}
}
