package com.dao;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.Order;
import com.dto.Sales;
import com.dto.Topping;


@Repository
public class OrderDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<Order> Order_Chart(Map<String, String> map){
		List<Order> list = template.selectList("OrderMapper.Order_Chart",map);
		return list;
	}
	
	public void addOrder(Order odto,Topping tdto) {
		System.out.println("order>>?? "+odto);
		System.out.println("Topping>>?? "+tdto);
		
		//Order주문상세 등록	
		 template.insert("OrderMapper.addOrder",odto);
		
		List<Sales> list=  new ArrayList<>();
		
		//해당 아이디에 맞는 주문 오더리스트 출력
		String userid= odto.getOrder_id();
		System.out.println("userid  "+userid);
		 Order order = template.selectOne("OrderMapper.getOrder",userid);
		 
		 //이 오더 코드로 sales_list 테이블에 데이터 입력해야함.
		 String order_code = order.getOrder_code();
		 String menu_code =tdto.getMenu_code();
		 int sales_amount =Integer.parseInt(tdto.getCount());
		 String sales_price =tdto.getPrice();
		 //tdto.setOrder_code(order_code);
		 
		 System.out.println("order_code>>> "+order_code);
		 System.out.println(menu_code);
		 System.out.println(sales_amount);
		 System.out.println(sales_price);
		 
		 
		 String [] arr = tdto.getTopingArr();
		 String [] arr2 = tdto.getTopingPriceArr();
		 int[] nums = Arrays.asList(arr2).stream().mapToInt(Integer::parseInt).toArray();
		 
		 
		 for(int i=0;i<arr.length;i++) {
			 System.out.println(arr[i]);
			 System.out.println(arr2[i]);
			 
			 
			 Sales sdto = new Sales(order_code,arr[i],menu_code,sales_amount,"",nums[i]);
			 list.add(sdto);
			 
			 
		 }
		 System.out.println(list);
		 template.insert("OrderMapper.addSalesList",list);
		 template.update("OrderMapper.updateStock",menu_code);
		
	}

}
