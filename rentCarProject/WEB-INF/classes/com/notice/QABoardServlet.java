package com.notice;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.QABoardDTO;
import com.dto.QABoardPageDTO;
import com.service.QABoardService;

@WebServlet("/QABoard")
public class QABoardServlet extends HttpServlet {
    public QABoardServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String curPage = request.getParameter("curPage");
		if(curPage == null) curPage = "1";
		
		String perPage = request.getParameter("perPage");
		if(perPage == null) perPage = "10";
		
		String searchName = request.getParameter( "searchName" );
		String searchValue = request.getParameter( "searchValue" );
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
		String perBlock = request.getParameter("perBlock");
		if(perBlock == null) perBlock = "10";
		
		
		QABoardPageDTO pDto = new QABoardPageDTO();
		pDto.setCurPage(Integer.parseInt(curPage));
		pDto.setPerPage(Integer.parseInt(perPage));
		pDto.setPerBlock(Integer.parseInt(perBlock));
		
		//QABoard List 출력 servlet
		QABoardService service = new QABoardService();
		QABoardPageDTO list = null;
		list = service.getAllList(pDto, map);
		//System.out.println(list);
		request.setAttribute("list", list);
		
		int totalNum = list.getTotalCount()/list.getPerPage();
		if(list.getTotalCount()%list.getPerPage()!=0) totalNum++;
		// 현재 화면에 보여질 페이지번호들의 시작페이지번호, 마지막페이지번호 구하기
	    // 현재 페이지번호의 블럭번호 구하기
		int curBlock = ( int )Math.ceil( ( double )list.getCurPage() / list.getPerBlock());

	    // 시작페이지번호 구하기
	    int startPage = ( curBlock - 1 ) * list.getPerBlock() + 1;
	    
	    // 마지막페이지번호 구하기
	    int endPage = startPage + list.getPerBlock() - 1;
	    if ( endPage > totalNum ) endPage = totalNum;
	    
	    HashMap<String, Object> paging = new HashMap<>();
	    paging.put("curBlock", curBlock);
	    paging.put("startPage", startPage);
	    paging.put("endPage", endPage);
	    paging.put("curPage", list.getCurPage());
	    paging.put("perPage", list.getPerBlock());
	    paging.put("totalNum", totalNum);
	    //System.out.println("paging "+paging);
	    request.setAttribute("paging", paging);
		RequestDispatcher dis = request.getRequestDispatcher("qaboard_list.jsp");
		dis.forward(request, response);
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
