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
import dto.JoinDTO;


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
			
			
			
			
			PrintWriter pw = response.getWriter();
			pw.println("<html>");
			pw.println("<head>");
			pw.println("<title>" + dto.getM_email() +"님의 정보</title>");
			pw.println("</head>");
			pw.println("<body>");
			pw.println("<h1>" + dto.getM_email() + "님의 정보보기</h1>");
			pw.println("아이디 : " + dto.getM_email() +"<br>");
			pw.println("암호 :" + dto.getM_password() + "<br>");
			pw.println("이름 :" + dto.getM_name() + "<br>");
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

		doGet(request, response);
	}

}
