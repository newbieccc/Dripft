package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentsDAO;

@WebServlet("/commentLike")
public class CommentLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final CommentsDAO dao = new CommentsDAO();

	public CommentLike() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		System.out.println(action);
		if (action.equals("like")) {

			doCLike(request, response);
		} else if (action.equals("dislike")) {

			doCDislike(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doCLike(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String ip = util.getIP.getIPV4(request);
		PrintWriter pw = response.getWriter();
		try {

			if (dao.CommentLike(c_no, ip) == 1) {

				dao.CommentLikeUp(c_no);
				pw.println("<script>");
				pw.println("location.href = document.referrer");
				pw.println("</script>");

			} else {

				pw.println("<script>");
				pw.println("alert('이미 추천한 댓글입니다.')");
				pw.println("history.back()");
				pw.println("</script>");

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public void doCDislike(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String s_email = (String) request.getSession().getAttribute("m_email");
		PrintWriter pw = response.getWriter();
		try {

			if (dao.CommentDislike(c_no, s_email) == 1) {

				dao.CommentDislikeUp(c_no);
				pw.println("<script>");
				pw.println("location.href = document.referrer");
				pw.println("</script>");

			} else {

				pw.println("<script>");
				pw.println("alert('이미 비추천한 댓글입니다.')");
				pw.println("history.back()");
				pw.println("</script>");

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
