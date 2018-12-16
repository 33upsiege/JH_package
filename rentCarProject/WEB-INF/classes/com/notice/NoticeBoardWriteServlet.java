package com.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.service.BoardService;

/**
 * Servlet implementation class NoticeBoardWriteServlet
 */
@WebServlet("/NoticeBoardWrite")
public class NoticeBoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writedate = request.getParameter("writeday");
		
		BoardDTO dto = new BoardDTO(userid,title,content,writedate);
		BoardService service = new BoardService();
		int n =service.insertBoard(dto);
		
		String nextPage = "";
		if(n!=0) {
			nextPage="NoticeBoard";
			System.out.println("빠짐");
		}else {
			nextPage="NoticeUIWrite";
		}
		response.sendRedirect(nextPage);
		/*RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);*/
		

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
