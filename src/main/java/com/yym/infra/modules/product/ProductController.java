package com.yym.infra.modules.product;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
	public String home(Model model, @ModelAttribute("vo") ProductVo vo) throws Exception {
		
		model.addAttribute("listAd", service.selectListProductAD());
		model.addAttribute("listAd2", service.selectListProductAD2());
		
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
	
	@RequestMapping(value = "/product/orderList")
	public String orderList(Model model, ProductVo vo) throws Exception {
		
		model.addAttribute("orderList", service.selectListOrder(vo));
		model.addAttribute("productOrderList", service.selectListProductOrder(vo));
		
		return "/product/orderList";
	}
	
	@RequestMapping(value = "/product/productView")
	public String productView(Model model, @ModelAttribute("vo") ProductVo vo) throws Exception {
		
		model.addAttribute("listAd", service.selectListProductAD());
		
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
			System.out.println(dto.getCheckboxTrprArray()[i] + "?????????, ?????? : " + dto.getTrctQuantityArray()[i] + ", ???????????? : " + dto.getTrprFullNameArray()[i]);
		}
		
		// checkboxTrprArray, TrctQuantityArray, trprFullNameArray ??? ?????? ???????????? ??????
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
	
	@RequestMapping(value="/product/productOrder")
	public String productOrder(ProductVo vo, Product dto, RedirectAttributes redirectAttributes) throws Exception {
		
		vo.setIfmmSeq(dto.getIfmmSeq());
		for(int i = 0; i < dto.getCheckboxTrprArray().length; i++) {
			vo.setTrprSeq(dto.getCheckboxTrprArray()[i]);
			service.deleteCartGeneral(vo);
		}
		
		service.insertOrder(dto);
		
		redirectAttributes.addFlashAttribute("dto", dto);
		
		return "redirect:/product/productCheckOut2";
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
		vo.setIfsaSeq(dto.getIfsaSeq());
		model.addAttribute("rt", service.selectOneMemberCheckOut(vo));
		model.addAttribute("rt2", service.selectOneShippingAddress(vo));
		
		return "product/productCheckOut2";
	}
	@RequestMapping(value = "/product/cartGeneral")
	public String cartGeneral(Model model, @ModelAttribute ("vo") ProductVo vo) throws Exception {
		
		model.addAttribute("listCartGeneral", service.selectListCartGeneral(vo));
		model.addAttribute("cartGeneralCount", service.selectCartGeneralCount(vo));
		model.addAttribute("cartWishListCount", service.selectCartWishListCount(vo));
		
		return "product/cartGeneral";
	}
	
	@RequestMapping(value = "/product/cartWishlist")
	public String cartWishlist(Model model, @ModelAttribute("vo") ProductVo vo) throws Exception {
		
		model.addAttribute("wishList", service.selectListWishList(vo));
		model.addAttribute("cartGeneralCount", service.selectCartGeneralCount(vo));
		model.addAttribute("cartWishListCount", service.selectCartWishListCount(vo));
		
		
		return "product/cartWishlist";
	}
	@RequestMapping(value = "/product/cartRegularDelivery")
	public String cartRegularDelivery(Model model, ProductVo vo) throws Exception {
		
		model.addAttribute("cartGeneralCount", service.selectCartGeneralCount(vo));
		model.addAttribute("cartWishListCount", service.selectCartWishListCount(vo));
		
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
	
	@ResponseBody
	@RequestMapping(value = "/product/selectCartCount")
	public Map<String, Object> selectCartCount(ProductVo vo) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		System.out.println(vo.getIfmmSeq());
		
		returnMap.put("cartGeneral", service.selectCartGeneralCount(vo));
		returnMap.put("cartWishList", service.selectCartWishListCount(vo));
		returnMap.put("cartRegularDelivery", 0);
				
		return returnMap;
	}
	
}
