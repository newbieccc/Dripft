package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dto.BoardDTO;

@WebServlet("/boardWrite")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String s_email = (String) session.getAttribute("m_email");
		int whatDo = Integer.parseInt(request.getParameter("write"));
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = new BoardDAO();
		
		if(whatDo == 0) {//whatDo가 0이면 로그인 여부 확인하고 페이지이동
			
			if(s_email != null)
				response.sendRedirect("./boardWrite.jsp");
			else
				response.sendRedirect("./login.jsp");
		}else { //1인 경우에는 로그인여부 확인하고 게시글 작성
		
			if(s_email != null) {
				
				dto.setB_email(s_email);
				dto.setB_title(request.getParameter("b_title"));
				dto.setB_content(request.getParameter("b_content"));
				dao.boardWrite(dto);
			
				response.sendRedirect("./boardlist");
			}else {
				
				response.sendRedirect("./login.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
