package com.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.service.BoardService;

/**
 * Servlet implementation class NoticeRepWrite
 */
@WebServlet("/NoticeRepWrite")
public class NoticeRepWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = "brown"; //추후 session.setAttribute("userid"); 로 변경 예정
		String rRoot = "0";
		if(request.getParameter("reproot") != null) {
			rRoot = request.getParameter("reproot");
		}
		String rStep = "0";
		if(request.getParameter("repstep") != null) {
			rStep = request.getParameter("repstep");
		}
		
		int reproot = Integer.parseInt(rRoot);
		int repstep = Integer.parseInt(rStep)+1;
		
		String comContent = request.getParameter("comContent");
		
		BoardDTO dto = new BoardDTO(0, comContent, null, userid, reproot, repstep);
		
		BoardService service = new BoardService();
		
		
		int n = service.repWrite(dto);
		
        
		/*		  JSONObject obj = new JSONObject();
		  try {
			  obj.put("result", dto.getContent());
			  obj.put("writedate", "12");
			  
			  //obj.put("name", fuser.getName());
				response.setContentType("text/xml;charset=utf-8");
				
				PrintWriter printWriter = response.getWriter();
				
				printWriter.print(obj);
				printWriter.flush();
				printWriter.close();
	             
	      } catch (Exception e) {
	              e.printStackTrace();
	      }
		*/
		//response.sendRedirect("NoticeBoardView?num="+reproot);
		//response.sendRedirect("aaa.jsp");
		
		/*String repstep2 = String.valueOf(repstep); //int형 string으로 변환
		 
		Map<String, String> map = new HashMap<>();
		map.put("content", comContent);
		map.put("repstep", repstep2);
		
		request.setAttribute("result",map);*/
		//request.getRequestDispatcher("aaa.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
