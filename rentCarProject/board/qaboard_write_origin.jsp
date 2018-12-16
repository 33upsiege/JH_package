<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<form action="QABoardWrite">
		글 제목 : <input type="text" name="title"><br>
		글 내용 : <textarea rows="10" cols="10" name="content"></textarea><br>
		문의종류 <select name="type">
					<option>예약 문의</option>
					<option>기타 문의</option>
				</select>
		<input type="submit" value="글 저장">
	</form>


