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

@WebServlet("/deleteAccount")
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteAccount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("1");
		JoinDTO dto = new JoinDTO();
		
		
		if(session.getAttribute("m_email") != null) {
			System.out.println(session.getAttribute("m_email"));
			
			dto.setM_email((String) session.getAttribute("m_email"));
			JoinDAO dao = new JoinDAO();
			dao.accountDel(dto);
			
			System.out.println("2");
			
			//리스폰 아닌가?ㅜ.ㅜ
			response.sendRedirect("./index.jsp");
		}
		System.out.println("3");
		response.sendRedirect("./index");
	}

}
