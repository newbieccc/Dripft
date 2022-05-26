package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinDAO;



@WebServlet("/emailCheck")
public class EmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmailCheck() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(request.getParameter("m_email") != null) {
			String email = request.getParameter("m_email");
			JoinDAO dao = new JoinDAO();
			int result = 1;
			result = dao.emailCheck(email);
			//System.out.println("1");
			
			PrintWriter pw = response.getWriter();
			pw.print(result);
		}
	
	}

}
