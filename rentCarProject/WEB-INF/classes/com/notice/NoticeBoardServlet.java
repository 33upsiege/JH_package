package com.notice;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.service.BoardService;

@WebServlet("/NoticeBoard")
public class NoticeBoardServlet extends HttpServlet {
    public NoticeBoardServlet() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curPage= request.getParameter("curPage");
        if(curPage == null){ //null이 아니면 값이 있다는 얘기
             curPage = "1"; 
             //처음 초기값 설정을 해준다. 1페이지를 보여주게 끔
        }

		BoardService service = new BoardService();
		BoardPageDTO pdto = service.selectBoardList(Integer.parseInt(curPage));
		List<BoardDTO> d = pdto.getList();
		
		Date date = new Date();
		SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd");
		String date2 = fmt1.format(date);
		
		for (BoardDTO bd : d) {
			String sqlDATE = bd.getWriteday();
			String sqlDATE2 = null;
			try {
				Date d2 = fmt1.parse(sqlDATE);
				System.out.println(d2+"d2날찌디!!!!!!!");
				sqlDATE2 = fmt1.format(d2);
				System.out.println(sqlDATE2+"sqlDATE2날짜따!!!");
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
	
			int compare = date2.compareTo(sqlDATE2);
			if(compare>0) {
				System.out.println("date2가 더 큼");
				bd.setWriteday(sqlDATE2);
			}else if(compare < 0) {
				System.out.println("sqlTemple가 더 큼");
				bd.setWriteday(sqlDATE2);
			}else {
				System.out.println("둘이 시간 같음");
			}
			//date 포맷 끝
		}
		
		request.setAttribute("pdto", pdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("board_list.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
