package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentsDAO;

@WebServlet("/commentChange")
public class CommentChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final CommentsDAO dao = new CommentsDAO();

    public CommentChange() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");

		System.out.println((String)request.getSession().getAttribute("m_email"));
		System.out.println(action	);
		System.out.println(request.getParameter("c_no"));
		System.out.println(request.getParameter("c_content"));
		if(action.equals("commentChange")) {
			
			commentChange(request,response);
		}else if(action.equals("commentDelete")) {
			
			commentDelete(request,response);
		}
	}

	public void commentChange(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String c_content = request.getParameter("c_content");
		String s_email = (String)request.getSession().getAttribute("m_email");
		PrintWriter pw = response.getWriter();
		int result = 0;
		try {
			if(dao.CommentWriterCheck(c_no, s_email) == 1 && !(c_content.equals("")||c_content == null)) { //댓글쓴이가 로그인상태와 일치했을 때, 공백 아닐떄
				result = dao.CommentUpdate(c_no, c_content);
				System.out.println(result);
				pw.print(result);
			}else {
				
				pw.print(result);
			}
		} catch (Exception e) {
			
		}
	}
	
	public void commentDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String s_email = (String)request.getSession().getAttribute("m_email");
		PrintWriter pw = response.getWriter();
		int result = 0;
		try {
			if(dao.CommentWriterCheck(c_no, s_email) == 1) {
				
				result = dao.CommentDelete(c_no);
				pw.print(result);
			}else {
				
				pw.print(result);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
