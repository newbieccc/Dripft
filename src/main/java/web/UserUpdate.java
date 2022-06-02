package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.JoinDAO;
import dao.UserDAO;
import dto.JoinDTO;
import dto.LoginDTO;


@WebServlet("/userUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserUpdate() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("m_email") != null) {
			JoinDTO dto = new JoinDTO((String) session.getAttribute("m_email"));
			
			JoinDAO dao = new JoinDAO();
			dto = dao.userInfo(dto);
			
			
			//dao활용해서 유저 닉네임 받아오기 , request.setAttribute해서 jsp에 뿌려주기, 비밀번호변경 버튼 추가
			
			PrintWriter pw = response.getWriter();
			pw.println("<html>");
			pw.println("<head>");
			pw.println("<title>" + dto.getM_email() +"님의 정보</title>");
			pw.println("</head>");
			pw.println("<body>");
			pw.println("<h1>" + dto.getM_email() + "님의 정보보기</h1>");
			pw.println("아이디 : " + dto.getM_email() +"<br>");
			pw.println("암호 :" + dto.getM_password() + "<br>");
			pw.println("닉네임 :" + dto.getM_nickname() + "<br>");
			pw.println("생일 :" + dto.getM_birth() + "<br>");
			pw.println("성별 :" + dto.getM_gender() + "<br>");
			pw.println("핸드폰번호 : " + dto.getM_tel() + "<br>");
			pw.println("<hr>");
			pw.println("</body>");
			pw.println("</html>");
			RequestDispatcher rd = request.getRequestDispatcher("./userUpdate.jsp");
			//주소표시줄 유지, 화면만 변경
			request.setAttribute("userInfo", dto);
			rd.forward(request, response);
	}
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("m_email") != null) {
			LoginDTO dto = new LoginDTO();
			
			UserDAO dao = new UserDAO();
			dto.setM_email((String) session.getAttribute("m_email"));
			dto.setM_password(request.getParameter("m_password"));
			//System.out.println(request.getParameter("m_password"));
			//dto.setM_name(request.getParameter("m_name"));
			dto.setM_nickname(request.getParameter("m_nickname"));
			dto.setM_birth(request.getParameter("m_birth"));
			dto.setM_tel(request.getParameter("m_tel"));
			dao.update(dto);
			
			response.sendRedirect("./login.jsp");
		//	RequestDispatcher rd = request.getRequestDispatcher("./userInfo.jsp");
		//	request.setAttribute("userInfo", dto);
		}
	}

}
