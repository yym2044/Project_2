package com.yym.infra.modules.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	IndexDao dao;
	

}