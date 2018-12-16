package com.delivery.controller;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.KakaoPay;
import com.dto.Order;
import com.mytest.pay.util.RestHandler;
import com.mytest.pay.util.RestHandler.HttpMethodType;
/**
 * Handles requests for the application home page.
 */
@Controller
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	RestHandler restHandler = new RestHandler();
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping(value = "/restTest", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,String>> postRequest(@RequestBody KakaoPay pay, HttpSession session) {
		
		
		session.setAttribute("pay", pay);
		
		logger.info("test");
		restHandler.setAccessToken("1eef19b3ecfe03b1aa764a2ba77895a3");
		restHandler.setAdminKey("993d8998f3f9ed11cfdcdd75f96ec67c");
		String apiPath = "/v1/payment/ready";
		String params = "cid=TC0ONETIME&"
				+ "partner_order_id=partner_order_id&"
				+ "partner_user_id=partner_user_id&"
				+ "item_name="+pay.getItemName()+"&"
				+ "quantity="+pay.getQuantity()+"&"
				+ "total_amount="+pay.getTotalAmount()+"&"
				+ "vat_amount=200&"
				+ "tax_free_amount=0&"
				+ "approval_url=http://localhost:8090/controller/sucess&"
				+ "fail_url=http://localhost:8090/controller/fail&"
				+ "cancel_url=http://localhost:8090/controller/cancel";
				
				
		List<Map<String,String>> resultList = new ArrayList<Map<String, String>>();
		Map<String,String> resultMap = new HashMap<String,String>();
		
		
		// 카카오페이 버튼 클릭시 다음 페이지로 가는 url을 리턴해줌
		String returnData = restHandler.request(HttpMethodType.POST, apiPath, params);
		JSONObject jsonObj = new JSONObject(returnData); 
//		String nextUrl = (String) jsonObj.get("next_redirect_pc_url");
		
		resultMap.put("tid",(String) jsonObj.get("tid"));
		resultMap.put("next_redirect_app_url",(String) jsonObj.get("next_redirect_app_url"));
		resultMap.put("next_redirect_mobile_url",(String) jsonObj.get("next_redirect_mobile_url"));
		resultMap.put("next_redirect_pc_url",(String) jsonObj.get("next_redirect_pc_url"));
		resultMap.put("android_app_scheme",(String) jsonObj.get("android_app_scheme"));
		resultMap.put("ios_app_scheme",(String) jsonObj.get("ios_app_scheme"));
		resultMap.put("created_at",(String) jsonObj.get("created_at"));
		resultList.add(resultMap);
		return resultList;
		
	}
	
	@RequestMapping(value = "/sucess", method = RequestMethod.GET)
	public String sucess(HttpSession session) {
		KakaoPay pay =   (KakaoPay)session.getAttribute("pay");
		System.out.println(">>>> "+pay);
		
		return "order/sucess";
	}
	
	@RequestMapping(value = "/fail", method = RequestMethod.GET)
	public String fail() {
		return "fail";
	}
	
	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancel() {
		return "cancel";
	}
	
	@RequestMapping(value = "/kakaopay", method = RequestMethod.GET)
	public String kakaopay() {
		return "kakaopay";
	}
}	
	