package com.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.Product;
import com.service.ProductService;

@Controller
public class MenuController {
	
	@Autowired
	ProductService service;

	@RequestMapping(value = "/product")
	public String getProductList(Model m) throws Exception {
		List<Product> list = service.getProductRecommend();
		m.addAttribute("list",list);
		return "menu/product";
	}
	
	
	
	@RequestMapping("/listProduct")
	public  String getProduct(Model m ,@RequestParam("tabName") String tabName) {
		List<Product> list =null;
		if(tabName.equals("추천메뉴")) {
			 list = service.getProductRecommend();
		}else {
			 list = service.getProduct(tabName);
		}
		m.addAttribute("list",list);
		return "menu/ajax/productAjax";
	}
	
	
	@RequestMapping("/productInfo")
	public String getProductCode(@RequestParam("menu_code") String menu_code, RedirectAttributes list, Model m) {
		System.out.println(menu_code);
		List<Product> listInfo = service.getProductCode(menu_code);
		m.addAttribute("pdtlist",listInfo);
		//list.addFlashAttribute("pdtlist", listInfo);
		//System.out.println(pdtlist);
		return "menu/productDetail";
	}
}
