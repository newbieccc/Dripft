package web;

import java.util.*;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.*;
import dto.*;

@WebServlet("/boardDetail")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardDetail() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String s_email = (String) request.getSession().getAttribute("m_email");
		
		BoardDAO boarddao = new BoardDAO();
		CommentsDAO commentdao = new CommentsDAO();
		Cookie[] cookies = request.getCookies();

		Cookie isCookie = null;

		if (cookies != null && cookies.length > 0) { // 사용자가 가진 쿠키 중 해당 게시글에 해당하는 쿠키가 있다면 iscookie에 저장

			for (int i = 0; i < cookies.length; i++) {

				if (cookies[i].getName().equals("cookie"+b_no))
					isCookie = cookies[i];
			}
		}
		
		if (isCookie == null) { // 해당게시글 쿠키가 없으면 쿠키 등록

			Cookie newCookie = new Cookie("cookie" + b_no, "|" + b_no + "|");
			response.addCookie(newCookie);
			boarddao.BoardViewIncrease(b_no); //등록 후 게시글 조회수 증가
		} else {
			//있을경우니까 아무일도 일어나지 않지만 테스트로 쿠키값을 띄워보자
			System.out.println(isCookie.getValue());
		}

		// String error = request.get
		try {
			BoardViewDTO dto = boarddao.boardDetail(b_no);
			List<CommentViewDTO> commentList = commentdao.commentsList(b_no, s_email);
			
			if(boarddao.BoardWriterCheck(s_email, b_no) == 1) request.setAttribute("writerCheck", 1);
			request.setAttribute("list", dto);
			request.setAttribute("commentList", commentList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("./boardDetail.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
