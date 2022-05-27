package web;

import java.util.*;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import dto.*;

@WebServlet("/boardDetail")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		BoardDAO boarddao = new BoardDAO();
		CommentsDAO commentdao = new CommentsDAO(); 
		try {
			BoardViewDTO dto = boarddao.boardDetail(b_no);
			List<CommentViewDTO> commentList = commentdao.commentsList(b_no);
			
			request.setAttribute("list", dto);
			request.setAttribute("commentList", commentList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("./boardDetail.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
