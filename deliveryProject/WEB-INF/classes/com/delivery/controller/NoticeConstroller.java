package com.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.Notice;
import com.dto.Stock;
import com.service.NoticeService;
import com.service.StockService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeConstroller {
	
@Autowired
NoticeService service;
	   
	   @RequestMapping(value = "notice_list",method= RequestMethod.GET)
	   @CrossOrigin
	   public @ResponseBody List<Notice> Master_Stock_List2(Model m){
	      List<Notice> list = service.Notice_list();
	      return list;
	   }
	   
	   @RequestMapping(value = "notice_insert",method= RequestMethod.POST)
	   @CrossOrigin
	   public @ResponseBody void Notice_Insert(@RequestBody Notice no) {
		   service.Notice_Insert(no);
	   }
	   
	   
	   @RequestMapping(value = "notice")
	   public String Notice() {
		   System.out.println("시벨");
		  return "notice/notice";
	   }
}
