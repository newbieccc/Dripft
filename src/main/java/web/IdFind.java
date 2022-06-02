package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JoinDAO;
import dto.JoinDTO;

@WebServlet("/idFind")
public class IdFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdFind() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String m_name = request.getParameter("m_name");
		String m_tel = request.getParameter("m_tel");
		
		JoinDTO dto = new JoinDTO(m_name, m_tel);
		JoinDAO dao = new JoinDAO();
		
		String m_email = dao.idFind(dto);
		/* System.out.println(m_email); */
		if(m_email == null) {
			response.sendRedirect("./idFindFail.jsp");
			
		}else {
			
			RequestDispatcher rd = request.getRequestDispatcher("./idFind.jsp");
			request.setAttribute("m_email", dao.idFind(dto));
			rd.forward(request, response);
		}
		
		
		
	}

}
