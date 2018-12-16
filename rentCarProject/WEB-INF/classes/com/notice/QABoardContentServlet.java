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

@WebServlet("/QABoardContent")
public class QABoardContentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	//제목 클릭시 글내용 보여주는 servlet
	int num = Integer.parseInt(request.getParameter("num"));
	QABoardService service = new QABoardService();
	QABoardDTO dto = null;
	dto = service.getContent(num);

	request.setAttribute("dto", dto);
	RequestDispatcher dis = request.getRequestDispatcher("qaboard_content.jsp");
	dis.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
