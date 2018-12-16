package com.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.QABoardDTO;
import com.service.QABoardService;

@WebServlet("/QABoardWrite")
public class QABoardWriteServlet extends HttpServlet {
    public QABoardWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userid = (String)session.getAttribute("userid");
		if(userid==null) userid = "brown";  // response.sendRedirect("error.jsp"); 다 끝나면 세션아이디 예외처리 해줘야함
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String type = request.getParameter("type");
		
		QABoardDTO dto = new QABoardDTO();
		dto.setUserid(userid);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setType(type);
		
		QABoardService service = new QABoardService();
		int n = service.write(dto);
		
		response.sendRedirect("QABoardUI");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
