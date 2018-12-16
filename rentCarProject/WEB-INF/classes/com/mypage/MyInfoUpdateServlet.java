package com.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;
import com.service.MyPageService;

@WebServlet("/MyInfoUpdate")
public class MyInfoUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	
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
		
		String phone = phone1+"-"+phone2+"-"+phone3;

		String email = email1+"@"+email2;

		
		//mlevel 초기값 1 설정(일반 회원)
		int mlevel = 1;
		MemberDTO mDTO = new MemberDTO();
		mDTO.setUserid(userid);
		mDTO.setUsername(username);
		mDTO.setPasswd(passwd);
		mDTO.setPost(post);
		mDTO.setAddr1(addr1);
		mDTO.setAddr2(addr2);
		mDTO.setPhone(phone);
		mDTO.setBirth(birth);
		mDTO.setEmail(email);
		mDTO.setLicensetype(licensetype);
		mDTO.setLicensenum(licensenum);
		
		MyPageService service = new MyPageService();
		int n = service.updateMember(mDTO);
		System.out.println(mDTO);
		response.sendRedirect("my_update_complete.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
