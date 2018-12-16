package com.delivery.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dto.AddMenu;
import com.dto.Menu;
import com.dto.OrderInformationList;
import com.dto.OrderMember;
import com.dto.OrderNotice;
import com.dto.StockList;
import com.dto.Upload;
import com.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@Autowired
	JavaMailSender mailSender;

	@RequestMapping(value = "/admin/index")
	public String admin(  Model model) throws Exception {
		
		
		return "/admin/admin";
	} 
	
	@RequestMapping(value = "/admin_stock/stock_management")  
	public String adminOrder(  Model model) throws Exception {
		
		 
		return "/admin_stock/stock_management"; 
	} 

	@RequestMapping(value="/admin/orderNotice", method=RequestMethod.GET)
	public @ResponseBody List<Map<String,Object>> OrderNotice() {
		System.out.println("OrderNotice()");
		List<OrderNotice> orderNoticeList = service.getOrderNotice();
		
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
	
		for(int i=0; i < orderNoticeList.size(); i ++) {
			Map<String, Object> resultMap = new HashMap<String,Object>();
			resultMap.put("menuCode", orderNoticeList.get(i).getMenu().getmCode());
			resultMap.put("orderCode", orderNoticeList.get(i).getOrderList().getOrderCode());
			resultMap.put("salesAmount", orderNoticeList.get(i).getSalseList().getSalesAmount());
			resultMap.put("salesPaymentDate", orderNoticeList.get(i).getSalseList().getSalesPaymentDate());
			resultMap.put("orderAllPrice", orderNoticeList.get(i).getOrderList().getOrderAllPrice());
			resultMap.put("menuName", orderNoticeList.get(i).getMenu().getmName());
			resultMap.put("orderStatus", orderNoticeList.get(i).getOrderList().getOrderStatus());
			resultMap.put("orderCount", orderNoticeList.get(i).getOrderList().getOrderCount());
			resultList.add(resultMap);
			
		}                                                                 
		return resultList;
	}
	
	@RequestMapping(value="/admin/statusBtn", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> statusBtn(@RequestBody OrderInformationList orderInfo) {
		System.out.println("orderInfo "+orderInfo);
		OrderMember orderMember = service.tran(orderInfo);
		System.out.println("controller "+orderMember);
		
		Map<String, String> map = new HashMap<>();
		if(orderMember.getMember().getMemberEmail()!=null) {
			map.put("name", orderMember.getMember().getMemberName());
			map.put("email", orderMember.getMember().getMemberEmail());
			map.put("orderStatus", orderMember.getOrderInformationList().getOrderStatus());
			map.put("orderCode", orderMember.getOrderInformationList().getOrderCode());
		}else {
			map.put("name", orderMember.getGuest().getGMemberName());
			map.put("email", orderMember.getGuest().getGMemberEmail());
			map.put("orderStatus", orderMember.getOrderInformationList().getOrderStatus());
			map.put("orderCode", orderMember.getOrderInformationList().getOrderCode());
		}
		System.out.println("map "+map);
		
		String mailTo = map.get("email");
		
		Email email = new Email();
		
		String orderStatus = map.get("orderStatus");
		
		String name = map.get("name");
		if(orderStatus.equals("1")) {
			email.setSubject("Burger 주문 확인 메일 입니다.");
			email.setContent(name+"님의 주문이 확인 되었습니다.");
		}else if(orderStatus.equals("2")) {
			email.setSubject("Burger 배송 시작 메일 입니다.");
			email.setContent(name+"님 배송이 시작되었습니다.");
		}else if(orderStatus.equals("5")) {
			email.setSubject("Burger 주문 취소 메일 입니다.");
			email.setContent(name+"님 주문이 취소되었습니다.");
		}
		
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				mimeMessage.setFrom(new InternetAddress("hi244244@gmail.com","BurgerDelivery", "UTF-8"));
				mimeMessage.setSubject(email.getSubject(), "UTF-8");
				mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
				mimeMessage.setContent( email.getContent() , "text/html;charset=UTF-8");
				mimeMessage.setReplyTo(InternetAddress.parse(mailTo));
			}
		};

		try {
			mailSender.send(preparator);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="/admin/stockNotice", method=RequestMethod.GET)
	public @ResponseBody List<Map<String,Object>> StockNotice() {
		System.out.println("StockNotice()");
		List<StockList> stockNoticeList = service.getStockNotice();
		
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
	
		for(int i=0; i < stockNoticeList.size(); i ++) {
			Map<String, Object> resultMap = new HashMap<String,Object>();
			resultMap.put("pCode", stockNoticeList.get(i).getpCode());
			resultMap.put("pName", stockNoticeList.get(i).getpName());
			resultMap.put("pAmount", stockNoticeList.get(i).getpAmount());
			resultMap.put("pMinimumAmount", stockNoticeList.get(i).getpMinimumAmount());
			resultList.add(resultMap);
		}                                                                 
		return resultList;
	}
	
	@RequestMapping(value="/admin/addMenu", method=RequestMethod.POST)
	public String addMenu(AddMenu addMenu, Menu menu){
		
			System.out.println("addMenu "+addMenu+"menu "+menu );
			  
			String recipes = "";
			for (int i=0; i<addMenu.getRecipes().length; i++) {
				recipes += addMenu.getRecipes()[i]+"/";
			}
			System.out.println(recipes);
			
			CommonsMultipartFile theFile = addMenu.getTheFile();


			System.out.println("originalFileName "+theFile.getOriginalFilename());
			System.out.println("index "+theFile.getOriginalFilename().indexOf("."));
			int index = theFile.getOriginalFilename().indexOf(".");
			System.out.println("result "+theFile.getOriginalFilename().substring(0, index-1));
			
			String originalFileName = theFile.getOriginalFilename().substring(0, index);
			
			
			menu.setmImg(originalFileName);
			menu.setmRecipe(recipes);
		
			File f = new File("C:\\springStudy\\eclipse\\workspace\\deliveryProject\\src\\main\\webapp\\resources\\images" , originalFileName);
			
			try {
				theFile.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int n = service.addMenu(menu);	
		return "redirect:/admin/menuList";
	}
	
	@RequestMapping("/admin/menuList")
	public String menuList(@RequestParam(required=false)String category, Model model) {
		List<Menu> menuList = service.menuList(category);
		model.addAttribute("menuList", menuList);
		System.out.println(menuList);
		return "/admin/list_Menu";
	}

	@RequestMapping(value="/admin/addMenuForm", method=RequestMethod.GET)
	public String addMenuForm(Model model) {
		List<StockList> list = service.addMenuForm();
		model.addAttribute("stockList",list);
		System.out.println(list);
		return "/admin/add_menu";
	}
	
	@RequestMapping("/admin/delMenu")
	   public @ResponseBody String goodsCartDel(@RequestParam String mCode) {
	      int n = service.delMenu(mCode);
	      return "success";
	   }
		
}
	
