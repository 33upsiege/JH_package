package com.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.BoardService;

/**
 * Servlet implementation class NoticeDel
 */
@WebServlet("/NoticeDel")
public class NoticeDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("del접속");
		
		String num=request.getParameter("num");  
		BoardService service = new BoardService();
		
		int n = service.delBoard(num);
		System.out.println(n);
		
		
		String nextPage = "";
		if(n!=0) {
			nextPage="NoticeBoard";
		}else {
			nextPage="NoticeBoard";
		}
		response.sendRedirect(nextPage);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
