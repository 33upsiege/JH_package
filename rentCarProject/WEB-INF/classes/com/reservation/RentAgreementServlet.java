package com.reservation;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ReservationDTO;

@WebServlet("/RentAgreement")
public class RentAgreementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		//session.setAttribute("userid", "brown");
		String userId = (String)session.getAttribute("userid");
		
		ReservationDTO reservDTO = new ReservationDTO();
 
		String promotion = request.getParameter("promotion");
		String carOption = request.getParameter("car_option");
		String price = request.getParameter("price_option");
		
		String insurance = request.getParameter("insurance");	
		String rentDate = request.getParameter("rentdate");
		String returnDate = request.getParameter("returndate");
		String discountParam = request.getParameter("discount_price");
		String carId = request.getParameter("carid");
		String shopId = request.getParameter("shopid");
				
		
				
		String carName = request.getParameter("carname");
		String shopName = request.getParameter("shopname");

		reservDTO.setCarId(carId);
		reservDTO.setShopId(shopId);
		reservDTO.setRentDate(rentDate);
		reservDTO.setReturnDate(returnDate);
		reservDTO.setPrice(Integer.parseInt(discountParam.replaceAll(",", "")));
		reservDTO.setInsurance(insurance);
		reservDTO.setUserId(userId);
		
		request.setAttribute("reservDTO", reservDTO);

		request.setAttribute("carname", carName);
		request.setAttribute("shopname", shopName);
		request.setAttribute("promotion", promotion);
		request.setAttribute("insurance", insurance);
		request.setAttribute("carOption", carOption);
		request.setAttribute("price", price);
		request.setAttribute("discount_param", discountParam);
		
		
		RequestDispatcher dis = request.getRequestDispatcher("rent_agreement.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
