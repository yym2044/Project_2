package com.yym.infra.modules.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


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
	public String productCheckOut() throws Exception {
		
		
		return "product/productCheckOut";
	}
	@RequestMapping(value = "/product/productCheckOut2")
	public String productCheckOut2() throws Exception {
		
		
		return "product/productCheckOut2";
	}
	@RequestMapping(value = "/product/cartGeneral")
	public String cartGeneral(Model model, @ModelAttribute ("vo") ProductVo vo) throws Exception {
		
		model.addAttribute("listCartGeneral", service.selectListCartGeneral(vo));
		
		return "product/cartGeneral";
	}
	@RequestMapping(value = "/product/cartWishlist")
	public String cartWishlist() throws Exception {
		
		
		return "product/cartWishlist";
	}
	@RequestMapping(value = "/product/cartRegularDelivery")
	public String cartRegularDelivery() throws Exception {
		
		
		return "product/cartRegularDelivery";
	}

}
