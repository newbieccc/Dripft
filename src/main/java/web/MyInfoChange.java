package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JoinDAO;
import dto.JoinDTO;

@WebServlet("/myInfoChange")
public class MyInfoChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyInfoChange() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//System.out.println("doPost");
		HttpSession session = request.getSession();
		
		String m_email = (String)session.getAttribute("m_email");
		String m_nickName = request.getParameter("m_nickName");
		
		if(session.getAttribute("m_email") != null) {
			//System.out.println("111");
			
			JoinDTO dto = new JoinDTO();
			dto.setM_nickname(m_nickName);
			dto.setM_email(m_email);
			JoinDAO dao = new JoinDAO();
			dao.update(dto);
			
			
			
			//System.out.println("222");
			response.sendRedirect("./userInfo");
			
		} else {
			//System.out.println("333");
			response.sendRedirect("./userInfo");
			
		}
		
	}

}
