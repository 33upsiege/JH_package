package com.delivery.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.Member;
import com.dto.MyOrder;
import com.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;
	
	@RequestMapping(value="/mypage")	
	public String mypage(HttpSession session,Model model) {
		String member_id = (String)session.getAttribute("member_id");
		Member member = mypageService.getInfoMember(member_id);
		model.addAttribute("member",member);
		return "mypage/mypage";
	} 
	
	@RequestMapping(value="/mypage_update")	
	public String update_mypage(Member member, HttpSession session) {
		member.setMember_id((String)session.getAttribute("member_id"));
		member.setMember_name((String)session.getAttribute("member_name"));
		int n = mypageService.updateMypage(member);
		return "redirect:mypage";
	}
	
	@RequestMapping(value="/myorder")
	public String myorder(HttpSession session, Model model) {
		List<MyOrder> list = new ArrayList<>();
		String member_id = (String)session.getAttribute("member_id");
		System.out.println("컨트롤러 접근");
		list = mypageService.getMyOrder(member_id);
		model.addAttribute("list",list);
		
		return "mypage/myorder"; 
	}
}
