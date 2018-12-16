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
 * Servlet implementation class NoticeRepModify
 */
@WebServlet("/NoticeRepModify")
public class NoticeRepModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int CommentNum= Integer.parseInt(request.getParameter("CommentNum"));
		String UpdateComment = request.getParameter("UpdateComment");
		
		BoardDTO dto = new BoardDTO();
		dto.setNum(CommentNum);
		dto.setContent(UpdateComment);
		
		BoardService service = new BoardService();
		int n = service.repUpdate(dto);
		
		/*if(n!=0) {
			
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
