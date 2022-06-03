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
import java.util.*;
import dao.BoardDAO;
import dto.BoardViewDTO;

@WebServlet("/boardSearch")
public class BoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		BoardViewDTO dto = new BoardViewDTO();
		
		String searchField = request.getParameter("searchField");//검색유형
		String content = request.getParameter("content");
		
		
		BoardDAO dao = new BoardDAO();
		List<BoardViewDTO> list = dao.boardsearch(searchField, content);
		if(list==null) {
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('검색 결과가 없습니다.'); window.location.href = document.referrer; </script>");
		} else {
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("./boardsearch.jsp");
			rd.forward(request, response);
		}
	}

}
