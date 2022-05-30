package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dto.NoticeDTO;

@WebServlet("/noticeDetail")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = new NoticeDAO();
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		
		Cookie[] cookies = request.getCookies();
		Cookie isCookie = null;
		
		if (cookies != null && cookies.length > 0) { // 사용자가 가진 쿠키 중 해당 게시글에 해당하는 쿠키가 있다면 iscookie에 저장
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("cookieN"+n_no))
					isCookie = cookies[i];
			}
		}
		if (isCookie == null) { // 해당게시글 쿠키가 없으면 쿠키 등록
			Cookie newCookie = new Cookie("cookieN" + n_no, "|" + n_no + "|");
			response.addCookie(newCookie);
			dao.countUp(n_no); //등록 후 게시글 조회수 증가
		} else {
			//있을경우니까 아무일도 일어나지 않지만 테스트로 쿠키값을 띄워보자
			System.out.println(isCookie.getValue());
		}
		
		if(request.getParameter("n_no") != null
				&& util.Util.str2Int(request.getParameter("n_no"))) {
			
			RequestDispatcher rd = request.getRequestDispatcher("./noticeDetail.jsp");
			NoticeDTO dto = dao.noticeDetail(n_no);
			System.out.println(dto.getResultcount());
			if(dto.getResultcount() == 1) {
				request.setAttribute("dto", dto);
				rd.forward(request, response);				
			} else {
				response.sendRedirect("./main");
			}
		} else {			
			response.sendRedirect("./main");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("./notice.jsp");
	}

}
