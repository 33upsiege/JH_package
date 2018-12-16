package com.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dto.QABoardDTO;
import com.service.QABoardService;

@WebServlet("/QABoardRepWrite")
public class QABoardRepWriteServlet extends HttpServlet {
    public QABoardRepWriteServlet() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*<input type="hidden" name="num">
		<input type="hidden" name="reproot">
		<input type="hidden" name="repstep">
		문의타입 : <input type="text" name ="type" value="${dto.type}"><br>
		작성자ID : <input type="text" name ="userid" value="${dto.userid}"><br>
		글쓴시간 : <input type="text" name ="writeday" value="${dto.writeday}"><br>
		작성 제목 : <input type="text" name ="title" value="${dto.title}"><br>
		문의 내용 : <input type="text" name ="content" value="${dto.content}"><br>
*/	
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			userid = "admin"; //로그인 예외처리 해주면서 바꿔주기
		}
		int reproot = Integer.parseInt(request.getParameter("reproot"));
		int repstep = Integer.parseInt(request.getParameter("repstep"))+1;
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		QABoardDTO dto = new QABoardDTO(0, title, content, null, type, userid, reproot, repstep);
		
		QABoardService service = new QABoardService();
		int n = service.repWrite(dto);
		response.sendRedirect("QABoardUI");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
