package com.delivery.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.Member;
import com.service.MemberService;
 
@Controller  
public class UserController {

	@Autowired  
	MemberService memberService;
	
	@RequestMapping(value = "/login" , method=RequestMethod.GET)
	public String loginForm(  Model model) throws Exception {
		return "member/login";
	}
	
	@RequestMapping(value = "/login" , method=RequestMethod.POST)
	public String login(Member member, HttpSession session ) throws Exception {
		member = memberService.getLoginMember(member);
		session.setAttribute("member_id", member.getMember_id());
		session.setAttribute("member_name", member.getMember_name());
		session.setAttribute("member_nickname", member.getMember_nickname());
		
		//일반|관리자 분기
		if(member.getMember_id().equals("admin")) {
			return "redirect:/admin/menuList";
		} else {
			return "main/index";
		}
	}
	
	@RequestMapping(value = "/logout" , method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "main/index";
	}
	
	@RequestMapping(value = "/join")
	public String join(  Model model) throws Exception {
		return "member/join";
	}
	
	@RequestMapping(value = "/join2")
	public String join2(  Model model) throws Exception {
		return "member/join2";
	}
	
	@RequestMapping(value = "/join3")
	public String join3(Member member , String member_birthday1 ,String member_birthday2 ,String member_birthday3
						, String member_email1, String member_email2) throws Exception {
		
		member.setMember_birthday(member_birthday1+member_birthday2+member_birthday3);
		member.setMember_email(member_email1+"@"+member_email2);
		
		int n = memberService.addMember(member); 
		
		return "member/join3";
	}
	
	@RequestMapping(value = "/checkID" , method=RequestMethod.GET)
	public @ResponseBody String checkID(String member_id) throws Exception {
		String n = memberService.checkID(member_id);
		String result = null;
		if(n.equals("1")) {
			result = "no";
		} else {
			result = "ok";
		}
		return result;
	}
	
	
	@RequestMapping(value = "/find_id")
	public String id_find(  Model model) throws Exception {
		
		
		return "member/find_id";
	}
	
	@RequestMapping(value = "/pw_find")
	public String find_pw(  Model model) throws Exception {
		
		
		return "member/find_pw";
	} 
}
