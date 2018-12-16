package com.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dto.Stock;
import com.service.StockService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class StockController {

	@Autowired
	StockService service;

	@RequestMapping(value = "/admin_stock/stockmanagement")
	public ModelAndView Master_Stock_List() {
		List<Stock> list = service.Stock_list();
		ModelAndView mav = new ModelAndView();

		mav.addObject("Stocklist", list);
		mav.setViewName("/admin_stock/stockmanagement");

		return mav;
	}

	@RequestMapping(value = "/admin_stock/stockmodify", method = RequestMethod.POST)
	public void Master_Stock_Modify(@RequestBody Stock so, Model m) {
		int n = service.Stock_Modify(so);
	}

	@RequestMapping(value = "/admin_stock/stockmodifyplus", method = RequestMethod.POST)
	public void Master_Stock_Modify_plus(@RequestBody Stock so, Model m) {
		int n = service.Stock_Modify_plus(so);
	}

	@RequestMapping(value = "/admin_stock/stockdelete", method = RequestMethod.POST)
	public void Master_Stock_Delete(@RequestBody Stock so, Model m) {
		int n = service.Stock_Delete(so);
	}

	@RequestMapping(value = "/admin_stock/stockinsert", method = RequestMethod.POST)
	public void Master_Stock_Insert(@RequestBody Stock so, Model m) {
		int n = service.Stock_Insert(so);
	}

	@RequestMapping(value = "/admin_stock/stockMamountModify", method = RequestMethod.POST)
	public void Master_Stock_Minimum_amount_modify(@RequestBody Stock so, Model m) {
		int n = service.Stock_Minimum_amount_modify(so);
	}

	@RequestMapping(value = "/admin_stock/saleschart")
	public String Master_Chart_View() {
		return "/admin_stock/saleschart";
	}



}
