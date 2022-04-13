package com.yym.infra.modules.product;

import java.util.ArrayList;
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
	
	//이게 될까
	List<String> trocSeqList1 = new ArrayList<String>();
	List<String> trocSeqList2 = new ArrayList<String>();
	List<String> trocSeqList3 = new ArrayList<String>();
	//
	
	
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
	@Override
	public Product selectOneProduct_Real(ProductVo vo) throws Exception {
		return dao.selectOneProduct_Real(vo);
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
					
					trocSeqList1.add(dto.getTrocSeq());
					
					
				}
			} else if(i==1) {
				for(int j=0; j<dto.getTrocNameArray2().length; j++) {
					dto.setTrocName(dto.getTrocNameArray2()[j]);
					dto.setTrocAdditionalPrice(dto.getTrocAdditionalPriceArray2()[j]);
					dto.setTrocOrder(j+1);
					
					dao.insertOptionChild(dto);
					
					trocSeqList2.add(dto.getTrocSeq());
					
					
				}
			} else {
				for(int j=0; j<dto.getTrocNameArray3().length; j++) {
					dto.setTrocName(dto.getTrocNameArray3()[j]);
					dto.setTrocAdditionalPrice(dto.getTrocAdditionalPriceArray3()[j]);
					dto.setTrocOrder(j+1);
					
					dao.insertOptionChild(dto);
					
					trocSeqList3.add(dto.getTrocSeq());
					
				}
			}
			
			
		}
		
		System.out.println("trocSeqList1.size() : " + trocSeqList1.size());
		System.out.println("trocSeqList2.size() : " + trocSeqList2.size());
		System.out.println("trocSeqList3.size() : " + trocSeqList3.size());
		
		if(trocSeqList1.size() != 0 && trocSeqList2.size() != 0 && trocSeqList3.size() != 0) {
			
			int index = 0;
			
			for(int i = 0; i < trocSeqList1.size(); i++) {
				for(int j = 0; j < trocSeqList2.size(); j++) {
					for(int k = 0; k < trocSeqList3.size(); k++) {
						System.out.println(trocSeqList1.get(i) + "-" + trocSeqList2.get(j) + "-" + trocSeqList3.get(k));
						
						dto.setTrprOptionChildCd1(trocSeqList1.get(i));
						dto.setTrprOptionChildCd2(trocSeqList2.get(j));
						dto.setTrprOptionChildCd3(trocSeqList3.get(k));
						
						dto.setTrprListPrice(dto.getTrprListPriceArray()[index]);
						dto.setTrprDiscountPrice(dto.getTrprDiscountPriceArray()[index]);
						dto.setTrprStock(dto.getTrprStockArray()[index]);
						dto.setTrprUseNy(1);
						dto.setTrprDelNy(0);
						
						dao.insertProduct_Real(dto);
						
						index++;
					}
				}
			}
		} else if(trocSeqList1.size() != 0 && trocSeqList2.size() != 0 && trocSeqList3.size() == 0) {
			
			int index = 0;
			
			for(int i = 0; i < trocSeqList1.size(); i++) {
				for(int j = 0; j < trocSeqList2.size(); j++) {
					System.out.println(trocSeqList1.get(i) + "-" + trocSeqList2.get(j));
					
					dto.setTrprOptionChildCd1(trocSeqList1.get(i));
					dto.setTrprOptionChildCd2(trocSeqList2.get(j));
					
					dto.setTrprListPrice(dto.getTrprListPriceArray()[index]);
					dto.setTrprDiscountPrice(dto.getTrprDiscountPriceArray()[index]);
					dto.setTrprStock(dto.getTrprStockArray()[index]);
					dto.setTrprUseNy(1);
					dto.setTrprDelNy(0);
					
					dao.insertProduct_Real(dto);
					
					index++;
				}
			}
		} else if(trocSeqList1.size() != 0 && trocSeqList2.size() == 0 && trocSeqList3.size() == 0) {
			for(int i = 0; i < trocSeqList1.size(); i++) {
				
				System.out.println(trocSeqList1.get(i));
				
				dto.setTrprOptionChildCd1(trocSeqList1.get(i));
				dto.setTrprListPrice(dto.getTrprListPriceArray()[i]);
				dto.setTrprDiscountPrice(dto.getTrprDiscountPriceArray()[i]);
				dto.setTrprStock(dto.getTrprStockArray()[i]);
				dto.setTrprUseNy(1);
				dto.setTrprDelNy(0);
				
				dao.insertProduct_Real(dto);
				
			}
		} else {
			// by pass
		}
		
		trocSeqList1.clear();
		trocSeqList2.clear();
		trocSeqList3.clear();
		
		dao.updateOptionParentCd(dto);
		
		for(MultipartFile multipartFile : dto.getFile0()) {
			
			if(!multipartFile.getOriginalFilename().equals("")) {
				
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				
				UtilUpload.upload(multipartFile, pathModule, dto);
				
				dto.setTableName("tradProductUploaded");
				dto.setType(0);
				dto.setDefaultNy(1);
				dto.setSort(1);
				dto.setPseq(dto.getTrpdSeq());
				
				dao.insertProductUploaded(dto);
			}
		}
		
		int j = 1;
		for(MultipartFile multipartFile : dto.getFile1()) {
			
			if(!multipartFile.getOriginalFilename().equals("")) {
				
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
			
		}
		
				
		return 1;
	}
}
