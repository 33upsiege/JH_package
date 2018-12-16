package com.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.service.BoardService;

/**
 * Servlet implementation class NoticeBoardModify
 */
@WebServlet("/NoticeBoardModify")
public class NoticeBoardModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String num = request.getParameter("num");
		String content = request.getParameter("content");
		System.out.println(num);
		System.out.println(title);
		System.out.println(content);
		
		BoardDTO dto = new BoardDTO();
		dto.setNum(Integer.parseInt(num));
		dto.setTitle(title);
		dto.setContent(content);
		
		BoardService service = new BoardService();
		
		int n = service.updateBoard(dto);
		
		String nextPage = null;
		if(n!=0) {
			nextPage="NoticeBoardView?num="+num;
			
		}else {
			nextPage="board_list.jsp";
		}
		
		response.sendRedirect(nextPage);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
