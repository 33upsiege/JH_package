package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.service.MemberService;
@WebServlet("/SignUp")
public class SignUpServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String birth = request.getParameter("birth");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String licensetype = request.getParameter("licensetype");
		String licensenum = request.getParameter("licensenum");
		
		//phone 문자열 결합
		String phone = phone1+"-"+phone2+"-"+phone3;
		
		//email 문자열 결합
		String email = email1+"@"+email2;
		
		//mlevel 초기값 1 설정(일반 회원)
		int mlevel = 1;
		MemberDTO mDTO = new MemberDTO(userid, username, passwd, post, addr1, addr2, phone, birth, email, licensetype, licensenum, mlevel);
	
		MemberService service = new MemberService();
		int n = service.addMember(mDTO);
		
		response.sendRedirect("loginCompleted.jsp");
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
