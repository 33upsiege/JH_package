package com.mypage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MyQADTO;
import com.dto.MyRentCheckPageDTO;
import com.dto.ReservationDTO;
import com.service.MyPageService;
import com.service.ReservationService;


@WebServlet("/MyRentCheck")
public class MyRentCheckServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		//session.setAttribute("userid", "brown");
		
		String curPage = request.getParameter("curPage");
		if(curPage == null) curPage = "1";
		
		String perPage = request.getParameter("perPage");
		if(perPage == null) perPage = "5";
		
		String perBlock = request.getParameter("perBlock");
		if(perBlock == null) perBlock = "5";
		
		
		
		String userId = (String)session.getAttribute("userid");
		System.out.println(userId);
		String startDate = (String)request.getParameter("start_date");
		String endDate = (String)request.getParameter("end_date");
		
		//예약내역
		MyRentCheckPageDTO pDTO = new MyRentCheckPageDTO();
		pDTO.setCurPage(Integer.parseInt(curPage));
		pDTO.setPerPage(Integer.parseInt(perPage));
		pDTO.setPerBlock(Integer.parseInt(perBlock));
		pDTO.setStartDate(startDate);
		pDTO.setEndDate(endDate);
		pDTO.setUserId(userId);
		
		MyPageService service = new MyPageService();
		MyRentCheckPageDTO reservList = null;
		reservList = service.rentCheck(pDTO);
		
		
		request.setAttribute("reservList", reservList);
		System.out.println("reservList"+reservList);
		
		int totalNum = reservList.getTotalRecord()/reservList.getPerPage();
		if(reservList.getTotalRecord()%reservList.getPerPage()>0) {
			totalNum++;
		}
		
		int curBlock = ( int )Math.ceil( ( double )reservList.getCurPage() / reservList.getPerBlock());
		int startPage = (curBlock-1)*reservList.getPerBlock()+1;
		int endPage = startPage+reservList.getPerBlock()-1;
		if(endPage > totalNum) {
			endPage = totalNum;
		}
		HashMap<String, Object> paging = new HashMap<>();
	    paging.put("curBlock", curBlock);
	    paging.put("startPage", startPage);
	    paging.put("endPage", endPage);
	    paging.put("curPage", reservList.getCurPage());
	    paging.put("perPage", reservList.getPerBlock());
	    paging.put("totalNum", totalNum);
	    request.setAttribute("paging", paging);
		System.out.println(paging);
		
		
		RequestDispatcher dis = request.getRequestDispatcher("my_rentcheck.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
