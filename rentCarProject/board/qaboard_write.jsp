<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <style>
 .qa_box{width:500px;height:500px;}
 .contents .bg{ position:fixed;top:0;left:0; width:100%; height:100%; background:rgba(0, 0, 0, .4); opacity:0.7; z-index: 5;}
 
 .tbl_type3{position: absolute;
    top: 29%;
    left: 50%;
    margin-left: -315px;
    width: 630px;
    height: 350px;
    background: #fff;
    z-index: 7;
    withd:90px;}
.qa_contents{border: 3px solid #083763;}
.row{width:90px}
    </style>
<script type="text/javascript" src="..js/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
<script>
$(document).ready(function(){
	 $(".complete_btn #btnSign").click(function(e){
		var qa_title = $('input:text[name=title]').val();
		var qa_contents = $('textarea[name=content]').val();
		if(qa_title.length==0){
			alert("제목을 입력해주세요.")
			$('input:text[name=title]').focus();
			e.preventDefault();
		}else if(qa_contents.length==0){
			alert("내용을 입력해주세요.")
			$('textarea[name=content]').focus();
			e.preventDefault();
		}
	});
	 $('.bg').on("click",function(e) {  
			var ok = confirm("이 페이지에서 나가시겠습니까? 작성 내용은 저장되지 않습니다")
			if(ok==false){
				e.preventDefault();
			}else if(ok==true){
			if($('#writeForm').css("display:none")){
				$('#writeForm').show();  
			}else{
				$('#writeForm').hide();   
			}
		}
      });
	 $("#qa_list").on("click",function(e){
		 var ok = confirm("이 페이지에서 나가시겠습니까? 작성 내용은 저장되지 않습니다")
			if(ok==false){
				e.preventDefault();
			}else if(ok==true){
			if($('#writeForm').css("display:none")){
				$('#writeForm').show();  
			}else{
				$('#writeForm').hide();   
			}
		}
   });

	 
});
</script>

<div class="contents">
  <div class="qa_box">
	<div class="bg"></div>
		<form action="QABoardWrite">
		<input type="hidden" name="writedate" class="input_txt" style="width:80%">
		<div class="tbl_type3">
			<div class="qa_contents">
				<table>
<%-- 					<colgroup> --%>
<%-- 						<col width="90px" /> --%>
<%-- 					</colgroup> --%>
					<tbody>  
						<tr>
							<th class="row">문의종류</th>
							<td class="kind_of_qa"> 
							<select name="type" id="type_select">
								<option value="예약 문의">예약 문의</option>
								<option value="기타 문의">기타 문의</option>
							</select>
							</td> 
						</tr>
						<tr>
							<th class="row">작성자</th>
							<td><input type="text" name="userid" readonly class="input_txt" style="width:80%;border:none;" value="${sessionScope.userid}"></td>
						</tr>
						<tr>
							<th class="row">제목</th>
							<td><input type="text" name="title" class="input_txt" style="width:80%" placeholder="제목을 입력해주세요."></td>
						</tr>
					
						<tr>
							<td colspan="2">
								<textarea placeholder="500자 이내로 작성해 주십시오."rows="" cols="" name="content"style="border:1px solid #e4e4e4;width:100%;height:200px;"></textarea>
							</td>
						</tr>
					</tbody>
				</table> 
			
			</div><br>
		<div class="complete_btn t_r">
				<button type="submit" id="btnSign" class="btn_r btn_type1"><span>등록</span></button>
				<a href="QABoard" class="btn_l btn_type2" id="qa_list"><span>목록</span></a>
			</div>
			</div>
			</form>
	</div>		
</div>