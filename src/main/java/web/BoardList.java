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
import dto.BoardDTO;

@WebServlet("/boardlist")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardList() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNo = 1;
		if(request.getParameter("b_no") != null) {
			pageNo = Integer.parseInt(request.getParameter("b_Pno"));
		}
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> boardList = dao.boardList(pageNo * 10 - 10);
		
		RequestDispatcher rd = request.getRequestDispatcher("./board.jsp");
		request.setAttribute("list", boardList);
		request.setAttribute("viewcount", boardList.get(0).getB_viewcount());
		request.setAttribute("b_no", boardList.get(0).getB_no()); 
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
