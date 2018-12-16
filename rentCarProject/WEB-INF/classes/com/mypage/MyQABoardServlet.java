package com.mypage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MyQADTO;
import com.service.MyPageService;

@WebServlet("/MyQABoard")
public class MyQABoardServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		
		//session.setAttribute("userid", "brown");
		
		String userId = (String)session.getAttribute("userid");
		String startDateQA = (String)request.getParameter("start_dateQA");
		String endDateQA = (String)request.getParameter("end_dateQA");
		
		//1:1
	    String curPageQA = request.getParameter("curPageQA");
		if(curPageQA == null) curPageQA = "1";
		
		String perPageQA = request.getParameter("perPageQA");
		if(perPageQA == null) perPageQA = "5";
		
		String perBlockQA = request.getParameter("perBlockQA");
		if(perBlockQA == null) perBlockQA = "5";
		
		MyQADTO qaDTO = new MyQADTO();
		qaDTO.setCurPage(Integer.parseInt(curPageQA));
		qaDTO.setPerPage(Integer.parseInt(perPageQA));
		qaDTO.setPerBlock(Integer.parseInt(perBlockQA));
		qaDTO.setStartDate(startDateQA);
		qaDTO.setEndDate(endDateQA);
		qaDTO.setUserId(userId);
		
		MyPageService service = new MyPageService();
		MyQADTO myQaList = null;
		myQaList = service.myQaList(qaDTO);
		
		request.setAttribute("myQaList", myQaList);
		System.out.println(myQaList);
		
		int totalNumQA = myQaList.getTotalRecord()/myQaList.getPerPage();
		if(myQaList.getTotalRecord() % myQaList.getPerPage()>0) {
			totalNumQA++;
		}

		int curBlockQA = ( int )Math.ceil( ( double )myQaList.getCurPage() / myQaList.getPerBlock());
		int startPageQA = (curBlockQA-1)*myQaList.getPerBlock()+1;
		int endPageQA = startPageQA+myQaList.getPerBlock()-1;
		if(endPageQA > totalNumQA) {
			endPageQA = totalNumQA;
		}
		
		HashMap<String, Object> pagingQA = new HashMap<>();
	    pagingQA.put("curBlockQA", curBlockQA);
	    pagingQA.put("startPageQA", startPageQA);
	    pagingQA.put("endPageQA", endPageQA);
	    pagingQA.put("curPageQA", myQaList.getCurPage());
	    pagingQA.put("perPageQA", myQaList.getPerBlock());
	    pagingQA.put("totalNumQA", totalNumQA);
	    request.setAttribute("pagingQA", pagingQA);
		System.out.println("pagingQA"+pagingQA);
		
		RequestDispatcher dis = request.getRequestDispatcher("my_qaboard.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
