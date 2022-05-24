package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinDAO;
import dto.JoinDTO;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Join() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("m_email");
		String password = request.getParameter("m_password");
		String name = request.getParameter("m_name");
		String nickname = request.getParameter("m_nickname");
		String birth = request.getParameter("m_birth");
		String gender = request.getParameter("m_gender");
		String tel = request.getParameter("m_tel");
		int authority = Integer.parseInt(request.getParameter("m_authority"));
		String joindate = request.getParameter("m_joindate");
		
		JoinDTO dto = new JoinDTO();
		
		JoinDAO dao = new JoinDAO();
		int result = dao.join(dto);
		PrintWriter pw = response.getWriter();
		if(result == 0) {
			pw.println("<html>");
			pw.println("<head>");
			pw.println("<meta charset=\"UTF-8\">");			
			pw.println("<title>가입불가</title>");
			pw.println("</head>");
			pw.println("<body>");
			pw.println("<h1>가입에 실패하였습니다.</h1>");
			pw.println("<h2>다시 시도해주세요.</h2>");
			pw.println("<a href='./join.jsp'>가입하러가기</a>");
			pw.println("</body>");
			pw.println("</html>");
		}else {
			pw.println("<html>");
			pw.println("<head>");
			pw.println("<meta charset=\"UTF-8\">");	
			pw.println("<title>가입성공</title>");
			pw.println("</head>");
			pw.println("<body>");
			pw.println("<h1>가입에 성공하였습니다.</h1>");
			pw.println("<a href='./index'>로그인하러가기</a>");
			pw.println("</body>");
			pw.println("</html>");
			
		}
	}

}
