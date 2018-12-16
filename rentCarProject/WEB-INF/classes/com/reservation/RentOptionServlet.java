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

@WebServlet("/RentOption")
public class RentOptionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			  HttpSession session = request.getSession();
		
			  //session.setAttribute("userid", "brown");
			  String userId = (String)session.getAttribute("userid");
		
		
			  //String price = request.getParameter("price");
	          String carId = request.getParameter("carSelect").split("/")[1];
	          String carPrice = request.getParameter("carSelect").split("/")[2];
		      String shopId = request.getParameter("shopid");
		      String rentDate = request.getParameter("rentdate");
		      String returnDate = request.getParameter("returndate");   
		      String carName = request.getParameter("carSelect").split("/")[0];
		      String shopName = request.getParameter("shopname");
		      String price = request.getParameter("price_param");
		      String discountParam = request.getParameter("discount_param");
		      
		      ReservationDTO reservDTO = new ReservationDTO();
		      reservDTO.setCarId(carId);
		      reservDTO.setShopId(shopId);
		      reservDTO.setRentDate(rentDate);
		      reservDTO.setReturnDate(returnDate);
			      
			  request.setAttribute("reservDTO", reservDTO);   

			  request.setAttribute("carname", carName);
			  request.setAttribute("shopname", shopName);
			  request.setAttribute("carprice", carPrice);
			  request.setAttribute("price", price);
			  request.setAttribute("discount_param", discountParam);
			  
			  
			  RequestDispatcher dis = request.getRequestDispatcher("rent_option.jsp");
		      dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
