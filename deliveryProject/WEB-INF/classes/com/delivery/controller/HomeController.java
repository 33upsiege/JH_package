package com.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.Product;
import com.service.ProductService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired 
	ProductService service;
	@RequestMapping(value = "/index")
	public ModelAndView index() throws Exception {
		
		
		List<Product> list = service.product_list();
			System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("xxx",list);
		mav.setViewName("main/index");
		return mav;
	}

	
}
