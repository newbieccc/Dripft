package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentsDAO;
import dto.*;

@WebServlet("/commentWrite")
public class commentWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public commentWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		CommentsDAO dao = new CommentsDAO();
		CommentDTO dto = new CommentDTO();
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String m_email = (String)session.getAttribute("m_email");
		String c_content = request.getParameter("c_content");
		
		if(m_email != null) {
			
			dto.setB_no(b_no);
			dto.setM_email(m_email);
			dto.setC_content(c_content);
			dao.commentWrite(dto);
			
			response.sendRedirect("./boardDetail?b_no=" + b_no);
		}else {
			
			response.sendRedirect("./login.jsp");
		}
	}

}
