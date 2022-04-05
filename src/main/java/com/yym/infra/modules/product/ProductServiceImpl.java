package com.yym.infra.modules.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yym.infra.common.util.UtilDateTime;

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
	@Override
	public List<Product> selectListOptions(ProductVo vo) throws Exception {
		return dao.selectListOptions(vo);
	}
	
	
	
//	@PostConstruct
//	public void optionParentForCache() {
//		List<Product> optionParentListFromDb = (ArrayList<Product>) dao.optionParentForCache();
//		
//		Product.cachedOptionParentArrayList.clear();
//		Product.cachedOptionParentArrayList.addAll(optionParentListFromDb);
//		System.out.println("cachedOptionParentArrayList: " + Product.cachedOptionParentArrayList.size() + " catched !!");
//		
//	}
	
	
	@Override
	public int insertProduct(Product dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		
		dao.insertProduct(dto);
		
		for(int i=0; i<dto.getTropNameArray().length; i++) {
			
			dto.setTropName(dto.getTropNameArray()[i]);
			
			dao.insertOptionParent(dto);
		}
		
//		// infrMemberPhone
//		for(int i=0; i<dto.getIfmpNumberArray().length; i++) {
//			dto.setIfmpDefaultNy(dto.getIfmpDefaultNyArray()[i]);
//			dto.setIfmpTypeCd(dto.getIfmpTypeCdArray()[i]);
//			dto.setIfmpDeviceCd(dto.getIfmpDeviceCdArray()[i]);
//			dto.setIfmpTelecomCd(dto.getIfmpTelecomCdArray()[i]);
//			dto.setIfmpNumber(dto.getIfmpNumberArray()[i]);
//			
//			dao.insertPhone(dto);
//		}
				
		return 1;
	}
}
