package com.yym.infra.modules.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yym.infra.common.util.UtilDateTime;
import com.yym.infra.common.util.UtilUpload;

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
	@Override
	public List<Product> selectListUploaded(ProductVo vo) throws Exception {
		return dao.selectListUploaded(vo);
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
			dto.setTropOrder(i+1);
			
			dao.insertOptionParent(dto);
			
			if(i==0) {
				for(int j=0; j<dto.getTrocNameArray1().length; j++) {
					dto.setTrocName(dto.getTrocNameArray1()[j]);
					dto.setTrocAdditionalPrice(dto.getTrocAdditionalPriceArray1()[j]);
					dto.setTrocOrder(j+1);
					
					dao.insertOptionChild(dto);
				}
			} else if(i==1) {
				for(int j=0; j<dto.getTrocNameArray2().length; j++) {
					dto.setTrocName(dto.getTrocNameArray2()[j]);
					dto.setTrocAdditionalPrice(dto.getTrocAdditionalPriceArray2()[j]);
					dto.setTrocOrder(j+1);
					
					dao.insertOptionChild(dto);
				}
			} else {
				for(int j=0; j<dto.getTrocNameArray3().length; j++) {
					dto.setTrocName(dto.getTrocNameArray3()[j]);
					dto.setTrocAdditionalPrice(dto.getTrocAdditionalPriceArray3()[j]);
					dto.setTrocOrder(j+1);
					
					dao.insertOptionChild(dto);
				}
			}
			
		}
		
		dao.updateOptionParentCd(dto);
		
		for(MultipartFile multipartFile : dto.getFile0()) {
			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
			
			UtilUpload.upload(multipartFile, pathModule, dto);
			
			dto.setTableName("tradProductUploaded");
			dto.setType(0);
			dto.setDefaultNy(1);
			dto.setSort(1);
			dto.setPseq(dto.getTrpdSeq());
			
			dao.insertProductUploaded(dto);
		}
		
		int j = 1;
		for(MultipartFile multipartFile : dto.getFile1()) {
			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
			
			UtilUpload.upload(multipartFile, pathModule, dto);
			
			dto.setTableName("tradProductUploaded");
			dto.setType(0);
			dto.setDefaultNy(0);
			dto.setSort(j);
			dto.setPseq(dto.getTrpdSeq());
			
			dao.insertProductUploaded(dto);
			j++;
		}
		
				
		return 1;
	}
}
