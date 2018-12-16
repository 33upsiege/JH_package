package com.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.MemberService;

@WebServlet("/IDCheck")
public class IDCheckServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		
		response.setContentType("text/html; charset=UTF-8");
		MemberService service = new MemberService();
		int n = service.idCheck(userid);
		PrintWriter out = response.getWriter();
		
		if(n == 0 ) { //아이디 사용가능
			out.print("사용 가능한 ID입니다");
		} else { //아이디 중복
			out.print("중복되는 ID입니다");
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
