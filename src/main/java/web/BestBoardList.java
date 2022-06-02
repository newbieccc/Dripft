package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardViewDTO;

@WebServlet("/bestBoardList")
public class BestBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BestBoardList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNo = 1;
		if(request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		BoardDAO dao = new BoardDAO();
		List<BoardViewDTO> bestBoardList = dao.bestBoardList((pageNo-1) * 10);
		
		RequestDispatcher rd = request.getRequestDispatcher("./bestBoard.jsp");
		request.setAttribute("list", bestBoardList);
		request.setAttribute("viewcount", bestBoardList.get(0).getB_viewcount());
		request.setAttribute("b_no", bestBoardList.get(0).getB_no());
		request.setAttribute("totalcount", bestBoardList.get(0).getTotalcount());
		request.setAttribute("pageNo", pageNo);
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
