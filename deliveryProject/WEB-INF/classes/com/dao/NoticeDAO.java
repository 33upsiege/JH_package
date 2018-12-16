package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.Notice;
import com.dto.Stock;

@Repository
public class NoticeDAO {

   @Autowired
   SqlSessionTemplate template;
   
   public List<Notice> Notice_list(){
      List<Notice> list = template.selectList("NoticeMapper.noticeList");
      return list;
   }
   public void Notice_Insert(Notice no) {
	   template.insert("NoticeMapper.noticeInsert",no);
   }
  

}