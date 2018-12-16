package com.notice;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.service.BoardService;

/**
 * Servlet implementation class NoticeBoardView
 */
@WebServlet("/NoticeBoardView")
public class NoticeBoardView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String num = request.getParameter("num");
		String strBoardNum = num;
		int boardNum = -1;
		List<BoardDTO> commentList;
		BoardService service = new BoardService();
		BoardDTO dto = service.viewBoard(num);
		
		if(strBoardNum != null && !strBoardNum.equals("")) {
			if(strBoardNum != null && !strBoardNum.equals("")) {
				boardNum = Integer.parseInt(strBoardNum);
			}
			commentList = new ArrayList<BoardDTO>();
			
			if(boardNum != -1) {
				commentList = service.getCommentList(boardNum);
				
				if(commentList != null && commentList.size() > 0) {
					
					request.setAttribute("commentList", commentList);
				}
			}	
		}
		
		String nextPage = "";
		if(dto!=null) {
			nextPage="board_view.jsp";
			System.out.println("리스트들옴");
		}else {
			nextPage="board_list.jsp";
		}
		
		/*RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);*/
		
		//date 포맷
		/*
		Date date = new Date();
		SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(date);
		System.out.println(fmt1.format(date)); //2018-08-20
		String date2 = fmt1.format(date);
		String sqlDATE = dto.getWriteday();
		

		Date strDate = null; 
		Date sqlTemple = null;
		try {
			strDate = fmt1.parse(date2);
			sqlTemple = fmt1.parse(sqlDATE);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int compare = strDate.compareTo(sqlTemple);
		if(compare>0) {
			System.out.println("strdate가 더 큼");
			fmt2 = new SimpleDateFormat("yyyy-MM-dd");
			
			 System.out.println(sqlDATE+"sqldddd");
			 strDate3 =(String) fmt2.format(sqlDATE);
			dto.setWriteday(fmt1.format(date));
		}else if(compare < 0) {
			System.out.println("sqlTemple가 더 큼");
			dto.setWriteday(fmt1.format(date));
		}else {
			System.out.println("둘이 시간 같음");
			
		}*/
		//date 포맷 끝
		
		
		/*System.out.println(strDate);
		System.out.println(sqlTemple);*/
	

		
		request.setAttribute("boardList", dto);
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
		

		//response.sendRedirect(nextPage);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
