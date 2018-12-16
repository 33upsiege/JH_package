package com.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("servlet");
      String userid= request.getParameter("userid");
      String passwd= request.getParameter("passwd");
      System.out.println(userid);
      HashMap<String, String> map = new HashMap<>();
      map.put("userid", userid);
      map.put("passwd", passwd);
      
      MemberService service = new MemberService();
      int n = service.login(map);
      String nextPage = "";
      
      if(n != 0) { //로그인 성공
         HttpSession session = request.getSession();
         session.setAttribute("userid", userid);
         nextPage="index.jsp";
      }else { //로그인 실패
         
         nextPage="LoginUI";
      }
      response.sendRedirect(nextPage);
      
   }//

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}