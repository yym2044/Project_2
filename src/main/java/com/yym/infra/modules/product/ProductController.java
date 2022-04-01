package com.yym.infra.modules.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ProductController {
	
	@Autowired
	ProductServiceImpl service;
	
	@RequestMapping(value = "/product/productSearch")
	public String productSearch(Model model, ProductVo vo) throws Exception {
		
		return "/product/productSearch";
	}
	
	@RequestMapping(value = "/product/productView")
	public String productView(ProductVo vo) throws Exception {
		
		
		return "product/productView";
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
	public String cartGeneral() throws Exception {
		
		
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
