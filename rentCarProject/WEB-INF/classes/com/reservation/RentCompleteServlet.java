package com.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ReservationDTO;
import com.service.ReservationService;


@WebServlet("/RentComplete")
public class RentCompleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		//session.setAttribute("userid", "brown");
		String userId = (String)session.getAttribute("userid");
		
		String carId = request.getParameter("carid");
		String shopId = request.getParameter("shopid");
		String rentDate = request.getParameter("rentdate");
		String returnDate = request.getParameter("returnDate");
		String insurance = request.getParameter("insurance");
		String discountPrice = request.getParameter("discountPrice");
		String navigation = request.getParameter("navigation");
		String babySeat = request.getParameter("babyseat");
		String babyCarriage = request.getParameter("babycarriage");
		
		String carOptionParam = request.getParameter("car_option");
		String[] carOption = carOptionParam.split(" ");
		
		ReservationDTO reservDTO = new ReservationDTO();
		reservDTO.setRentDate(rentDate);
		reservDTO.setReturnDate(returnDate);
		reservDTO.setInsurance(insurance);
		reservDTO.setCarId(carId);
		reservDTO.setShopId(shopId);
		reservDTO.setUserId(userId);
		
		for(int i=0; i < carOption.length; i++) {
			if(carOption[i].equals("네비게이션")) {
				reservDTO.setNavigation("Y");
			}else if(carOption[i].equals("베이비카시트")) {
				reservDTO.setBabySeat("Y");
			}else if(carOption[i].equals("유모차")) {
				reservDTO.setBabyCarriage("Y");
			}
			
		}
		
		reservDTO.setPrice(Integer.parseInt(discountPrice));
		
		ReservationService reservService = new ReservationService();
		int result = reservService.insertOrder(reservDTO,carId);
		if(result > 0 ) {
			response.sendRedirect("rent_complete.jsp");
		}else {
			String rentFailMesg = "예약에 실패했습니다. 예약페이지로 돌아갑니다.";
			request.setAttribute("rmesg", rentFailMesg);
			response.sendRedirect("util/error.jsp");
		}
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
