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

@WebServlet("/userInfo")
public class UserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("UserInfo -> get");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("m_email"));
		if(session.getAttribute("m_email") != null) {
			JoinDTO dto = new JoinDTO((String) session.getAttribute("m_email"));
			JoinDAO dao = new JoinDAO();
			
			dto = dao.userInfo(dto);
			
			RequestDispatcher rd = request.getRequestDispatcher("./userInfo.jsp");
			request.setAttribute("userInfo", dto);
			rd.forward(request, response);
		} else {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserInfo -> post");
	}

}
