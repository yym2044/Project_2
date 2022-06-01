package com.yym.infra.modules.product;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class ProductController {
	
	@Autowired
	ProductServiceImpl service;
	
	@RequestMapping(value = "/home")
	public String home(Model model, @ModelAttribute("vo") ProductVo vo) {
		
		return "/home";
	}
	
	@RequestMapping(value = "/product/productSearch")
	public String productSearch(Model model,@ModelAttribute("vo") ProductVo vo) throws Exception {
		
		System.out.println("vo.getShCategory() : " + vo.getShCategory());
		System.out.println("vo.getShBar() : " + vo.getShBar());
		
		int count = service.selectListCount(vo);
		
		vo.setParamsPaging(count); 
		
		if(count != 0) {
			model.addAttribute("list", service.selectList(vo));
		}
		
		
		return "/product/productSearch";
	}
	
	@RequestMapping(value = "/product/productView")
	public String productView(Model model, @ModelAttribute("vo") ProductVo vo) throws Exception {
		
		model.addAttribute("rt", service.selectOne(vo));
		model.addAttribute("listOption", service.selectListOptions(vo));
		model.addAttribute("listUploaded", service.selectListUploaded(vo));
		
		return "product/productView";
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/selectOneProduct_Real")//???????????????????????????????
//	public Product selectOneProduct_Real(ProductVo vo, @RequestParam("trpdSeq") String trpdSeq, @RequestParam("trprOptionChildCd1") Integer trprOptionChildCd1, @RequestParam("trprOptionChildCd2") Integer trprOptionChildCd2, @RequestParam("trprOptionChildCd3") Integer trprOptionChildCd3) throws Exception {
	public Product selectOneProduct_Real(ProductVo vo) throws Exception {
		
		Product product_real = service.selectOneProduct_Real(vo);
		
		return product_real;
	}
	
	
	@RequestMapping(value="/product/productForm")
	public String productForm() throws Exception {
		
		return "product/productForm";
	}
	
	@RequestMapping(value="/product/productInst")
	public String productInst(Product dto) throws Exception {
		
		service.insertProduct(dto);
		
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/product/productCheckOut")
	public String productCheckOut(Model model, ProductVo vo, @ModelAttribute("dto") Product dto) throws Exception {
		
		model.addAttribute("rt", service.selectOneMemberCheckOut(vo));
		model.addAttribute("listShippingAddress", service.selectListShippingAddress(vo));
		
		for(int i=0; i<dto.getCheckboxTrprArray().length; i++) {
			System.out.println(dto.getCheckboxTrprArray()[i] + "번상품, 수량 : " + dto.getTrctQuantityArray()[i] + ", 상품이름 : " + dto.getTrprFullNameArray()[i]);
		}
		
		// checkboxTrprArray, TrctQuantityArray, trprFullNameArray 에 값이 순서대로 담김
//		List<Product> rtProduct = new ArrayList<Product>();
//		for(int i=0; i<dto.getCheckboxTrprArray().length; i++) {
//			rtProduct.add(dto);
//		}
		
		List<String> rtProductSeq = new ArrayList<String>(Arrays.asList(dto.getCheckboxTrprArray()));
		List<String> rtProductName = new ArrayList<String>(Arrays.asList(dto.getTrprFullNameArray()));
		List<Integer> rtProductQuantity = new ArrayList<Integer>(Arrays.asList(dto.getTrctQuantityArray()));
		
		model.addAttribute("rtProductSeq", rtProductSeq);
		model.addAttribute("rtProductName", rtProductName);
		model.addAttribute("rtProductQuantity", rtProductQuantity);
		
		return "product/productCheckOut";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/product/insertShippingAddress")
//	public Map<String, Object> insertShippingAddress(Product dto) throws Exception {
//		
//		Map<String, Object> returnMap = new HashMap<String, Object>();
//		
//		if(service.insertShippingAddress(dto)>0) {
//			returnMap.put("rt", "success");
//		} else {
//			returnMap.put("rt", "fail");
//		}
//		
//		return returnMap;
//	}
	@ResponseBody
	@RequestMapping(value = "/product/selectOneShippingAddress")
	public Product selectOneShippingAddress(ProductVo vo) throws Exception {
		
		Product rt = service.selectOneShippingAddress(vo);

		return rt;
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/insertShippingAddress")
	public List<Product> insertShippingAddress(Product dto, ProductVo vo) throws Exception {
		
		List<Product> rt = new ArrayList<Product>();
		
		if(service.insertShippingAddress(dto)>0) {
			rt = service.selectListShippingAddress(vo);
		} else {
			rt = null;
		}
		
		return rt;
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/updateShippingAddress")
	public List<Product> updateShippingAddress(Product dto, ProductVo vo) throws Exception {
		
		List<Product> rt = new ArrayList<Product>();
		
		if(service.updateShippingAddress(dto)>0) {
			rt = service.selectListShippingAddress(vo);
		} else {
			rt = null;
		}
		
		return rt;
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/deleteShippingAddress")
	public List<Product> deleteShippingAddress(Product dto, ProductVo vo) throws Exception {
		
		List<Product> rt = new ArrayList<Product>();
		
		if(service.deleteShippingAddress(dto)>0) {
			rt = service.selectListShippingAddress(vo);
		} else {
			rt = null;
		}
		
		return rt;
	}
	
	@RequestMapping(value = "/product/productCheckOut2")
	public String productCheckOut2(Model model, ProductVo vo, @ModelAttribute("dto") Product dto) throws Exception {
		
		vo.setIfmmSeq(dto.getIfmmSeq());
		for(int i=0; i<dto.getCheckboxTrprArray().length; i++) {
			vo.setTrprSeq(dto.getCheckboxTrprArray()[i]);
			service.deleteCartGeneral(vo);
		}
		
//		for(int i=0; i<dto.getCheckboxTrprArray().length; i++) {
//			System.out.println("ㅏㅇ아ㅏ아아앙" + dto.getCheckboxTrprArray()[i]);
//		}
		
		model.addAttribute("rt", service.selectOneMemberCheckOut(vo));
		
		return "product/productCheckOut2";
	}
	@RequestMapping(value = "/product/cartGeneral")
	public String cartGeneral(Model model, @ModelAttribute ("vo") ProductVo vo) throws Exception {
		
		model.addAttribute("listCartGeneral", service.selectListCartGeneral(vo));
		
		return "product/cartGeneral";
	}
	
	@RequestMapping(value = "/product/cartWishlist")
	public String cartWishlist(Model model, @ModelAttribute("vo") ProductVo vo) throws Exception {
		
		model.addAttribute("wishList", service.selectListWishList(vo));
		
		
		return "product/cartWishlist";
	}
	@RequestMapping(value = "/product/cartRegularDelivery")
	public String cartRegularDelivery() throws Exception {
		
		
		return "product/cartRegularDelivery";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/product/insertCartGeneral")
	public Map<String, Object> insertCartGeneral(Product dto) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		if(service.insertCartGeneral(dto)>0) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/deleteCartGeneral")
	public Map<String, Object> deleteCartGeneral(ProductVo vo) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		if(service.deleteCartGeneral(vo)>0) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/selectListWishList")
	public List<Product> selectListWishList(ProductVo vo) throws Exception {
		
		List<Product> wishList = service.selectListWishList(vo);
		
		return wishList;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/product/insertWishList")
	public Map<String, Object> insertWishList(ProductVo vo) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		if(service.insertWishList(vo) > 0) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
	@RequestMapping(value = "/product/deleteWishListNotAjax")
	public String deleteWishListNotAjax(ProductVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.deleteWishListNowAjax(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/product/cartWishlist";
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/deleteWishList")
	public Map<String, Object> deleteWishList(ProductVo vo) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if(service.deleteWishList(vo)>0) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/productViewAjax")
	public Map<String, Object> productViewAjax(ProductVo vo) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("item", service.selectOne(vo));
		returnMap.put("options", service.selectListOptions(vo));
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
}
