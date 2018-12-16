<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>


</style>
<script type="text/javascript">
$(document).ready(function(){
	
	//select 박스 선택해두기
	var type = "${dto.type}";
	if(type != null){
		$(".type").val(type).selected;
	}
	
	//댓글 버튼 임시 이벤트 - style{display:none} 삭제
	$("#repBtn").on("click",function(){
		$("#rep").removeAttr("style");
	});
	
	 $("#updateBtn").on("click",function(){
		//$("#boardForm").attr("action","QABoardUpdate").submit();
		

//		 var modify = confirm('저장 하시겠습니까?');
	 	//location.href="QABoardUpdate"
		console.log("수정테스트1");
	/* 	if(modify==true){
	 	$("#boardForm").attr("action","QABoardUpdate").submit(); 
		alert("수정되었습니다");
		}else{
			return false;
		}	 */
		}); 
		
	
	
	
	$("#deleteBtn").on("click",function(){
		var chk = confirm('정말 삭제하시겠습니까?');
		if(chk){
			//location.replace("QABoardDelete?num="+${dto.num});
			location.href="QABoardDelete?num="+${dto.num};
		} else{
			return false;
		}
			
	});
	$("#reply_btn").on("click",function(){
		$("#reply_area").removeAttr("style");
		
	});
	$("#btnComment").on("click",function(event){
		var text_con = $("#combox").val();
		if(text_con==0){
			alert("내용을 입력해 주세요.");
			event.preventDefault();
		}		
	});
	
	/* $("#updateBtn").on("click",function(){
		$(".updateData").removeAttr("style");
		$(".info").attr("style","display: none");
	});
	 */
	
}); 

</script>
<style type="text/css">


</style>
</head>
 <body>
  <div class="contents">

   
   <!-- tbl_top -->

   <div class="tbl_top">
      <h4 class="tit_h4 f_l">게시판 상세 페이지</h4>
      <div class="f_r">
				<button id="updateBtn" class="btn_m btn_type5"><span>수정</span></button>
				<button id="deleteBtn" class="btn_m btn_type5"><span>삭제</span></button>
				<a href="QABoardUI"><button class="btn_m btn_type5"><span>목록</span></button></a>

      </div>
   </div>
   <!-- //tbl_top -->
   <div class="board_view">
      <table>
         <thead>
            <tr>
<%--                <th colspan="4"> 제목:<input class="updateData" style="display: none;" type="text" value="${dto.title}"> 
               					<span class="info">${dto.title}</span>
               <div style="float:right"><span>${dto.writeday}</span></div> --%>
               <th colspan="4"><span class="info">${dto.title}</span>
               <div style="float:right"><span>${dto.writeday}</span></div>
            </th> 
            </tr>
         </thead>
         <tbody >
         <%--    <tr>
               <td style="float:right">${dto.writeday}</td>
            </tr> --%>
            <tr>
              <%--  <td colspan="2" rowspan="2" height="200px" style="vertical-align:top">
               	내용:<textarea class="updateData" style="display: none;" rows="10" cols="10"></textarea>  
               <span class="info">${dto.content}</span></td> --%>
               <td colspan="2" rowspan="2" height="200px" style="vertical-align:top">
               	<span class="info">${dto.content}</span></td>
            </tr>
         </tbody>
      </table>
   </div>
	   
   <!-- 답글버튼 -->

   <div class="reply_btn" style="float:right">
   <button class="btn_type1"id="reply_btn" style="height: 40px;width: 80px;">답글 쓰기</button>
   </div>
   <br>
   <div class="cmt_comm_area"style="display: none;" id="reply_area">
      <div class="cmt_comm_top">
         <strong>답글</strong> <span>개인정보가 포함된 글은 게시를 삼가해 주세요.</span>
      </div>
      <div class="cmt_comm_box bg">
         <div class="cmt_comm" style="font-size:14">
            <form action="QABoardRepWrite" id="form">
            <input type="hidden" name="reproot" value="${dto.reproot }" id="reproot">
             <input type="hidden" name="repstep" value="${dto.repstep }" id="repstep">
             <input type="hidden" name="type" value="${dto.type }" id="type">
        <div class="reply_area">
            <strong>제목 : </strong><input type="text" name="title" style="width:833px;height:25px"><br>
	                    <p>　　　　　</p>
	        <strong>내용 : </strong><textarea name="content" id="combox"></textarea>
	        <br>
            <input type="submit" class="btn_type1" value="답글 등록" 
            style="float:right;height: 40px;width: 80px;">
       </div>
            </form>
         </div>
      </div>
   </div>
   <!-- //댓글 등록 -->
   <div id="result123"></div>
   <div class="tbl_bottom t_r"></div>
</div>
 </body>
</html>

</body>       
</html>