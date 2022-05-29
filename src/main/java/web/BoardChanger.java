package web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dto.BoardDTO;

@WebServlet("/boardChange.do")
public class BoardChanger extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardChanger() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		String s_email = (String) session.getAttribute("m_email");
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String b_title = request.getParameter("b_title");
		String b_content = request.getParameter("b_content");
		
		int result = 0;
		dto.setB_no(b_no);
		dto.setB_title(b_title);
		dto.setB_content(b_content);
		
		try {
			result = dao.BoardWriterCheck(s_email, b_no);
			if(result ==1 ) { //b_no에 해당되는 게시글이 세션유저와 일치했을 때
				if(dao.BoardChange(dto) == 1) { //업데이트가 정상적으로 이루어졌을 때
					
					response.sendRedirect("./boardDetail?b_no="+b_no);//해당 개시글로 이동
				}else {//에러났을 떄
					
					response.sendRedirect("./boardDetail?b_no="+b_no+"&error=noneboard");
				}
				
			}else {
				
				response.sendRedirect("./boardDetail?b_no="+b_no+"&error=wrongauthority");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("./boardDetail?b_no="+b_no+"&error=notexistboard");
		}
		
		
	}

}
