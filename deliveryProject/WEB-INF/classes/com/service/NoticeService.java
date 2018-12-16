package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NoticeDAO;
import com.dao.StockDAO;
import com.dto.Notice;
import com.dto.Stock;

@Service
public class NoticeService {

   @Autowired
    NoticeDAO dao;
   
   public List<Notice> Notice_list(){
      return dao.Notice_list();
   }
   
   public void Notice_Insert(Notice no) {
	   dao.Notice_Insert(no);
   }

}