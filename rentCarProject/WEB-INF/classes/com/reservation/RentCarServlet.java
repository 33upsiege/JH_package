package com.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CarDTO;
import com.dto.ReservationDTO;
import com.dto.ShopDTO;
import com.service.CarService;
import com.service.ShopService;

@WebServlet("/RentCar")
public class RentCarServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		//session.setAttribute("userid", "brown");
		String userId = (String)session.getAttribute("userid");
		
		String shopId = request.getParameter("shopid");
		String rentDate = request.getParameter("rentdate");
		String returnDate = request.getParameter("returndate");
		String carType = request.getParameter("carType");
		String price = request.getParameter("price");
		String discountPrice = request.getParameter("discount_price");
		
		System.out.println("price"+price);
		System.out.println("shopId : " +  shopId);
		System.out.println("carType : " +  carType);
		
		CarDTO dto = new CarDTO();
		if(carType != null) { 
			dto.setCarType(carType);
		}
		dto.setShopId(shopId);
		
		ShopDTO shopDTO = new ShopDTO();
		shopDTO.setShopId(shopId);
		
		CarService carService = new CarService();
		ShopService shopService = new ShopService();
				
		List<CarDTO> carList = null;
		
		carList = carService.carAllList(dto);
		
		ShopDTO shopList = shopService.getShopList(shopDTO);
		if(carList.size() <= 0 || carList == null) {
			request.setAttribute("msg", "검색결과가 없습니다.");
		}else {
			request.setAttribute("carList", carList);	
			request.setAttribute("shopList", shopList);
		}
		
		System.out.println(shopList);
		
		ReservationDTO reservDTO = new ReservationDTO();
		reservDTO.setRentDate(rentDate);
		reservDTO.setReturnDate(returnDate);
		reservDTO.setShopId(shopId);
		
		request.setAttribute("reservDTO", reservDTO);
		System.out.println(reservDTO);
		
		request.setAttribute("shopname", shopList.getShopName());
		request.setAttribute("price", price);
		request.setAttribute("discountprice", discountPrice);
		RequestDispatcher dis = request.getRequestDispatcher("rent_car.jsp");
		dis.forward(request, response);
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
