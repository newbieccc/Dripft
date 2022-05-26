package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoticeDAO;
import dto.NoticeDTO;
import util.Util;

@WebServlet("/noticeWrite")
public class NoticeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_email") != null) {
			RequestDispatcher rd = request.getRequestDispatcher("./noticeWrite.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("./login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String re = null;
		System.out.println(1);
		if(session.getAttribute("m_email") != null) {
			System.out.println(2);
			if(request.getParameter("title") != null
					&& request.getParameter("content") != null) {
				System.out.println(3);
				NoticeDTO dto = new NoticeDTO();
				dto.setN_content(request.getParameter("content"));
				dto.setN_title(Util.HTML2str(request.getParameter("title")));
				dto.setM_email((String) session.getAttribute("m_email"));
				NoticeDAO dao = new NoticeDAO();
				dao.noticeWrite(dto);
				
				re = "./noticeList";
			} else {				
				System.out.println(4);
				re = "./noticeList";
			}
		} else {
			System.out.println(5);
			re = "./login.jsp";
		}
		response.sendRedirect(re);
		
	}

}
