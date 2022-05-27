package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		if(request.getParameter("n_no") != null
				&& util.Util.str2Int(request.getParameter("n_no"))) {
			int n_no = Integer.parseInt(request.getParameter("n_no"));
			
			RequestDispatcher rd = request.getRequestDispatcher("./noticeDetail.jsp");
			
			NoticeDAO dao = new NoticeDAO();
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
