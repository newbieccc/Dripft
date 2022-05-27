package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinDAO;
import dto.JoinDTO;

@WebServlet("/pwFind")
public class PWFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PWFind() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String m_email = request.getParameter("m_email");
		String m_name = request.getParameter("m_name");
		String m_tel = request.getParameter("m_tel");
		String m_password = request.getParameter("m_password");
		String pw2 = request.getParameter("pw2");
		
		JoinDTO dto = new JoinDTO(m_email, m_name, m_tel, m_password);
		JoinDAO dao = new JoinDAO();
		
		if(m_password.equals(pw2)) {
			if(dao.pwFind(dto) == 1) {
				//회원정보가 정상적으로 업데이트 됨 -> 로그인창 고고
				response.sendRedirect("./login.jsp");				
			}else {
				//회원정보가 틀림 -> e_mail찾기 페이지
				response.sendRedirect("./idFind.jsp?error=1024");				
			}
		}else {
			//암호 두개가 안맞았음 -> 다시 그자리 pwFind.jsp
			response.sendRedirect("./pwFind.jsp");
		}		
		
	}

}
