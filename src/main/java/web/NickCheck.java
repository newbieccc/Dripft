package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nickCheck")
public class NickCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NickCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("1");
		if(request.getParameter("nickname") != null) {
			System.out.println(request.getParameter("m_nickName"));
			
			String m_nickName = request.getParameter("m_nickName");
			dao.JoinDAO dao = new dao.JoinDAO();
			int result = 1;
			result = dao.nickCheck(m_nickName);
			
			
			PrintWriter pw = response.getWriter();
			pw.print(result);
			
		}
		System.out.println("2");
	} 

}
