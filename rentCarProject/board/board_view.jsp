<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	$(document).ready(function() {
		$("#btnDel").click(function(e) {
			var k = confirm("정말 삭제 하시겠습니까?");
			if (k == false) {
				e.preventDefault();
			}

		});
		/* $("#btnComment").click(function(){
			var comBox = $("#combox").val();
			console.log(comBox)
			if(comBox.length==0){
				event.preventDefault();
				alert("내용을 입력해주세요.");
				
			}else{
				$('#form').submit();
			}
			
		}); */
		//ajax
		$("#btnComment").click(function() {

			//$(".ul_commbox").css("display", "block");

			var comBox = $("#combox").val();
			var reproot = $("#reproot").val();
			var repstep = $("#repstep").val();

			console.log(comBox)
			if (comBox.length == 0) {
				event.preventDefault();
				alert("내용을 입력해주세요.");

			} else {

				$.ajax({
					url : 'NoticeRepWrite', //text.jsp로 연결하겠다.
					type : "get", //방식 get post
					data : {
						"comContent" : comBox,
						"reproot" : reproot,
						"repstep" : repstep
					}, //comBox 가 servlet string과 같게 받아야 함.
					dataType : 'text', //요청했을 때 내가 받고싶은 형 종류
					success : function(data, status, xhr) { //지가 알아서 성공하면 이 함수 실행
						//console.log(data);//1
						//$("ul.cmt_comm_box").prepend(data);
		                location.reload();

					},
					error : function(xhr, status, error) { //실패하면 지가 알아서 이 함수 실행
						console.log(error);
					}

				});
			}//else
		});
		 $(".btnUpdateComplete").click(function() {
			var UpdateComment=$(this).parents(".cmt_comm").find("textarea").val();
			var CommentNum =$(this).parents(".cmt_comm").find("#CommentNum").val();
			//var c= $(this).
			console.log(UpdateComment)
			$.ajax({
				url : 'NoticeRepModify', //text.jsp로 연결하겠다.
				type : "get", //방식 get post
				data : {
					"CommentNum" :CommentNum,
					"UpdateComment" : UpdateComment
				}, //comBox 가 servlet string과 같게 받아야 함.
				dataType : 'text', //요청했을 때 내가 받고싶은 형 종류
				success : function(data, status, xhr) { //지가 알아서 성공하면 이 함수 실행
					 location.reload();

				},
				error : function(xhr, status, error) { //실패하면 지가 알아서 이 함수 실행
					console.log(error);
				}

			});
		
		}); 
		//수정 버튼 
		$(".btnUpdate").click(function() {
			$(this).parents(".cmt_comm").find(".cmt_comm_txt").contents().unwrap().wrap("<textarea></textarea>");
			$(this).parent().siblings().css("display","block");
			$(this).css("display","none");
			//<li><a href="javascript:void(0)" class="btnUpdateComplete">완료</a></li>
		});
		
			//$( 'h2' ).contents().unwrap().wrap( '<p></p>' );
		$(".btnComDel").click(function(e){
			var k = confirm("댓글을 삭제 하시겠습니까?")
			if (k == false) {
				e.preventDefault();
			}
		});
			

		//ajax
		/* $(".btnCommentDel").click(function(){
			var k =$(this).parents(".cmt_comm_btn").siblings(".CommentNum").val();
			$.ajax({
				url:'NoticeRepDel',  //text.jsp로 연결하겠다.
				type:"get",  //방식 get post
				data:{"num":k},
				dataType:'text', //요청했을 때 내가 받고싶은 형 종류
				success:function(data,status,xhr){  //지가 알아서 성공하면 이 함수 실행
					//console.log(data);
					console.log(k);
					
					$("#result123").text(data);
					 location.reload();
		 
				}, 
				error:function(xhr,status,error){  //실패하면 지가 알아서 이 함수 실행
					console.log(error);
				}  
				
			});
		}); */
		//text.jsp에있는 파일의 내용이 깜박거림 없이 html화면에 출력 된다.
	});
</script>




<div class="contents">

	<c:set var="boardList" value="${boardList}" scope="session" />
	<!-- tbl_top -->

	<div class="tbl_top">
		<h4 class="tit_h4 f_l">형카 공지사항</h4>
		<div class="f_r">
			<!-- <a href="NoticeUIWrite" class="btn_m btn_type3"><span>작성하기</span></a> -->
			<a href="NoticeDel?num=${boardList.num}" class="btn_m btn_type5"
				id="btnDel"><span>삭제</span></a> <a
				href="NoticeBoardUpdate?num=${boardList.num}"
				class="btn_m btn_type5"><span>수정</span></a> <a href="NoticeUI"
				class="btn_m btn_type5"><span>목록</span></a>

		</div>
	</div>
	<!-- //tbl_top -->
	<div class="board_view">
		<table>
			<colgroup>
				<col width="*">

				<col width="16%">

			</colgroup>
			<thead>
				<tr>
					<th scope="col" colspan="4">${boardList.title}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>글번호 : ${boardList.num}</td>
					<td>${boardList.writeday}</td>

				</tr>
				<tr>
					<td colspan="2">${boardList.content}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 댓글 -->

	 <c:if test="${! empty commentList}">
		<div class="cmt_comm_area commentlistBox">
			<div class="cmt_comm_top" >
				<strong>댓글 ${commentList.size()}개</strong>
			</div>
     
			<ul class="cmt_comm_box ul_commbox">
				<c:forEach var="x" items="${commentList }" varStatus="status">
					<li>
						<div class="cmt_comm">
							<input type="hidden" value="${x.num }" name="CommentNum" class="CommentNum" id="CommentNum">
							<div class="cmt_comm_con">
								<div class="cmt_comm_tit">
									<strong class="fc_blue">${x.userid }</strong><span
										class="cmt_comm_date">${x.writeday }</span>
									<!-- 	<strong class="fc_blue">dsgags****</strong> <span class="cmt_comm_date">2016-05-09</span> -->
								</div>
								<div class="cmt_comm_txt">${x.content }</div>
							</div>

							<ul class="cmt_comm_btn btn_list_type1">
								<!-- <li><a href="#">답변댓글</a></li> -->
								
								
								<li><a href="javascript:void(0)" class="btnUpdate">수정</a></li>
								<li style="display:none;"><a href="javascript:void(0)" class="btnUpdateComplete">완료</a></li>
								
								<li><a href="NoticeRepDel?num=${boardList.num}&CommentNum=${x.num}" class="btnComDel">삭제</a></li>
								<!-- <li><a href="#" class="btnCommentDel" >삭제</a></li> -->
							</ul>
						</div>
					</li>
				</c:forEach>

			</ul>

		</div>
	
    </c:if>
	<!-- //댓글 -->

	<!-- 댓글 등록 -->
	<div class="cmt_comm_area">
		<div class="cmt_comm_top">
			<strong>댓글 쓰기</strong> <span>타인을 비방하거나 개인정보를 유출하는 글의 게시를
				삼가주세요.</span>
		</div>
		<div class="cmt_comm_box bg">
			<div class="cmt_comm">
				<!-- /form action="NoticeRepWrite" id="form"> -->

				<input type="hidden" name="reproot" value="${boardList.reproot}"
					id="reproot"> <input type="hidden" name="repstep"
					value="${boardList.repstep}" id="repstep">
				<textarea name="comContent" cols="30" rows="10" id="combox"></textarea>
				<a href="javascript:void(0)" class="btn_ml btn_type1" id="btnComment"><span>댓글등록
						&gt;</span></a>
				<!-- </form> -->

			</div>
		</div>
	</div>
	<!-- //댓글 등록 -->
	<div id="result123"></div>
	<div class="tbl_bottom t_r"></div>
</div>