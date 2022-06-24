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
	
	List<String> trocSeqList1 = new ArrayList<String>();
	List<String> trocSeqList2 = new ArrayList<String>();
	List<String> trocSeqList3 = new ArrayList<String>();
	
	@Override
	public List<Product> selectList(ProductVo vo) throws Exception {
		return dao.selectList(vo);
	}
	@Override
	public Integer selectListCount(ProductVo vo) throws Exception {
		return dao.selectListCount(vo);
	}
	
	@Override
	public List<Product> selectListCartGeneral(ProductVo vo) throws Exception {
		return dao.selectListCartGeneral(vo);
	}
	@Override
	public Product selectOneMemberCheckOut(ProductVo vo) throws Exception {
		return dao.selectOneMemberCheckOut(vo);
	}
	@Override
	public List<Product> selectListShippingAddress(ProductVo vo) throws Exception {
		return dao.selectListShippingAddress(vo);
	}
	@Override
	public Product selectOneShippingAddress(ProductVo vo) throws Exception {
		return dao.selectOneShippingAddress(vo);
	}
	@Override
	public int insertShippingAddress(Product dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		
		dao.updateShippingDefaultNy(dto);
		
		return dao.insertShippingAddress(dto);
	}
	@Override
	public int updateShippingAddress(Product dto) throws Exception {
		
		dao.updateShippingDefaultNy(dto);
		
		return dao.updateShippingAddress(dto);
	}
	@Override
	public int deleteShippingAddress(Product dto) throws Exception {
		return dao.deleteShippingAddress(dto);
	}
	@Override
	public int insertCartGeneral(Product dto) throws Exception {
		
		dao.insertCartGeneral(dto);
		
		
		return 1;
	}
	@Override
	public int deleteCartGeneral(ProductVo vo) throws Exception {
		return dao.deleteCartGeneral(vo);
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
		
		
		
		if(dto.getOptionMethod() == 1) {
			
			dao.insertProduct(dto);
			//
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
							
							dto.setTrprDefaultNy(0);
							// 처음 들어가는 상품에 default 1 주기
							if(index == 0) {
								dto.setTrprDefaultNy(1);
							}
							
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
						
						dto.setTrprDefaultNy(0);
						// 처음 들어가는 상품에 default 1 주기
						if(index == 0) {
							dto.setTrprDefaultNy(1);
						}
						
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
					
					dto.setTrprDefaultNy(0);
					// 처음 들어가는 상품에 default 1 주기
					if(i == 0) {
						dto.setTrprDefaultNy(1);
					}
					
					dao.insertProduct_Real(dto);
					
				}
			} else {
				// by pass
			}
			
			trocSeqList1.clear();
			trocSeqList2.clear();
			trocSeqList3.clear();
			
			dao.updateOptionParentCd(dto);
			//
			
			
		} else {
			dto.setTrpdPrice(dto.getTrprListPriceArray()[0]);
			dao.insertProduct(dto);
			
			System.out.println("단일상품 등록프로세스^^");
			
			dto.setTrprListPrice(dto.getTrprListPriceArray()[0]);
			dto.setTrprDiscountPrice(dto.getTrprDiscountPriceArray()[0]);
			dto.setTrprStock(dto.getTrprStockArray()[0]);
			dto.setTrprUseNy(1);
			dto.setTrprDelNy(0);
			
			dto.setTrprDefaultNy(1);
			
			dao.insertProduct_Real(dto);
		}
		
		
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
		
		j = 1;
		for(MultipartFile multipartFile : dto.getFile2()) {
			
			if(!multipartFile.getOriginalFilename().equals("")) {
				
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				
				UtilUpload.upload(multipartFile, pathModule, dto);
				
				dto.setTableName("tradProductUploaded");
				dto.setType(1);
				dto.setDefaultNy(0);
				dto.setSort(j);
				dto.setPseq(dto.getTrpdSeq());
				
				dao.insertProductUploaded(dto);
				j++;
				
			}
			
		}
		
				
		return 1;
	}
	
	@Override
	public List<Product> selectListWishList(ProductVo vo) throws Exception {
		return dao.selectListWishList(vo);
	}
	@Override
	public int insertWishList(ProductVo vo) throws Exception {
		
		return dao.insertWishList(vo);
	}
	@Override
	public int deleteWishList(ProductVo vo) throws Exception {
		return dao.deleteWishList(vo);
	}
	
	public int deleteWishListNowAjax(ProductVo vo) throws Exception {
		
		for(int i = 0 ; i < vo.getTrpdSeqArray().length; i++) {
			vo.setTrpdSeq(vo.getTrpdSeqArray()[i]);
			dao.deleteWishList(vo);
		}
		
		return 1;
	}
	
	@Override
	public List<Product> selectListOrder(ProductVo vo) throws Exception {
		return dao.selectListOrder(vo);
	}
	
	@Override
	public List<Product> selectListProductOrder(ProductVo vo) throws Exception {
		return dao.selectListProductOrder(vo);
	}
	
	public int insertOrder(Product dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setIfpmSeq("1");
		Long randomNum = (long) Math.floor(Math.random() * 1000000000);
		while(randomNum > 300000000 || randomNum < 100000000) {
			randomNum = (long) Math.floor(Math.random() * 1000000000);
		}
		dto.setTrorOrderId(String.valueOf(randomNum));
		dto.setTrorDeliveryFee(dto.getTotalDelivery());
		
		dao.insertOrder(dto);
		
		for(int i = 0; i < dto.getCheckboxTrprArray().length; i++) {
			dto.setTrprSeq(dto.getCheckboxTrprArray()[i]);
			dto.setTrpoQuantity(dto.getTrctQuantityArray()[i]);
			dto.setTrpoName(dto.getTrprFullNameArray()[i]);
			dao.insertProductOrder(dto);
		}
		
		return 1;
	}
	
	public int selectCartGeneralCount(ProductVo vo) throws Exception {
		return dao.selectCartGeneralCount(vo);
	}
	public int selectCartWishListCount(ProductVo vo) throws Exception {
		return dao.selectCartWishListCount(vo);
	}
	
	public List<Product> selectListProductAD() throws Exception {
		return dao.selectListProductAD();
	}
	public List<Product> selectListProductAD2() throws Exception {
		return dao.selectListProductAD2();
	}
	
}
