package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import dto.LoginDTO;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("m_email") != null && request.getParameter("m_password") != null) {
			String id = request.getParameter("m_email");
			String pw = request.getParameter("m_password");

			LoginDTO dto = new LoginDTO();
			dto.setM_email(id);
			dto.setM_password(pw);
			LoginDAO dao = new LoginDAO();
			dto = dao.login(dto);
			
			System.out.println(dto.getCount());
			System.out.println(dto.getM_email());
			System.out.println(dto.getM_nickname());
			if (dto.getCount() == 1) {

				HttpSession session = request.getSession();
				session.setAttribute("m_nickname", dto.getM_nickname());
				session.setAttribute("m_email", dto.getM_email());

				String m_email = (String) session.getAttribute("m_email");
				String m_password = (String) session.getAttribute("m_password");

				response.sendRedirect("./main.jsp");
			} else {
				response.sendRedirect("./login.jsp?error=1024");
			}

		} else {
			response.sendRedirect("./login.jsp");
		}

	}
}