package web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dto.BoardViewDTO;

@WebServlet("/boardChange")
public class BoardChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardChange() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(Integer.parseInt(request.getParameter("del")) == 1) doPost(request, response);
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		BoardDAO dao = new BoardDAO();
		HttpSession session = request.getSession();
		RequestDispatcher rd = request.getRequestDispatcher("./boardChange.jsp");
		
		String s_email = (String) session.getAttribute("m_email");
		
		try {
			int result = dao.BoardWriterCheck(s_email, b_no);
			if(result == 1) {
				
				BoardViewDTO dto = dao.boardDetail(b_no);
				String title = dto.getB_title();
				String content = dto.getB_content();
				request.setAttribute("b_no", b_no);
				request.setAttribute("b_title", title);
				request.setAttribute("b_content", content);
				
				rd.forward(request, response);
			}else {
				
				response.sendRedirect("./boardDetail?b_no="+b_no+"&error=1024");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		System.out.println(b_no);
	}

}
