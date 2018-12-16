package com.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.QABoardDTO;
import com.service.QABoardService;

@WebServlet("/QABoardUpdate")
public class QABoardUpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title"); 
		String content = request.getParameter("content"); 
		String type = request.getParameter("type"); 
		int num = Integer.parseInt(request.getParameter("num")); 
		
		QABoardDTO dto = new QABoardDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setType(type);
		dto.setNum(num);
		QABoardService service = new QABoardService();
		int n = service.update(dto);
		
		request.setAttribute("num", num);
		
		RequestDispatcher dis = request.getRequestDispatcher("QABoard");
		//RequestDispatcher dis = request.getRequestDispatcher("board_update");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
