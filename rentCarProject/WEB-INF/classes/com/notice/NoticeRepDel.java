package com.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.BoardService;

/**
 * Servlet implementation class NoticeRepDel
 */
@WebServlet("/NoticeRepDel")
public class NoticeRepDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String CommentNum = request.getParameter("CommentNum");
		String num = request.getParameter("num");
		System.out.println("댓글삭제 진입"+CommentNum);
		System.out.println("보드글번호"+num);
		BoardService service = new BoardService();
		int n = service.commentDel(CommentNum); 
		
		String nextPage = null;
		if(n!=0) {
			nextPage="NoticeBoardView?num="+num; //NoticeBoardView?num=546
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
