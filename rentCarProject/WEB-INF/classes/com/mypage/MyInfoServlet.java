package com.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;
import com.service.MyPageService;

@WebServlet("/MyInfo")
public class MyInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		//session.setAttribute("userid", "brown");
		
		String userId = (String)session.getAttribute("userid");
		
		MemberDTO memberDTO = new MemberDTO();
		MyPageService myPageService = new MyPageService();
		memberDTO = myPageService.memberInfo(userId);
		
		request.setAttribute("memberDTO", memberDTO);
		
		RequestDispatcher dis = request.getRequestDispatcher("my_info_update.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
