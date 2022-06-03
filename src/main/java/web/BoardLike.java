package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import util.Util;

@WebServlet("/boardLike")
public class BoardLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardLike() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String ip = util.getIP.getIPV4(request);
		
		if(action.equals("like")) {
			if(dao.BoardLike(b_no, ip) == 1) {
				
				dao.BoardLikeUp(b_no);
				response.sendRedirect("./boardDetail?&b_no="+b_no);
			}else {
				
				response.sendRedirect("./boardDetail?&b_no="+b_no+"&error=alreadylike");
			}
		}else if(action.equals("dislike")) {
			if(dao.BoardDisLike(b_no, ip) == 1) {
				
				dao.BoardDisLikeUp(b_no);
				response.sendRedirect("./boardDetail?&b_no="+b_no);
			}else {
				
				response.sendRedirect("./boardDetail?&b_no="+b_no+"&error=alreadydislike");
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
