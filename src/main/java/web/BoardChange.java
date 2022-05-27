package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;

@WebServlet("/boardChange")
public class BoardChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardChange() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		BoardDAO dao = new BoardDAO();
		
		try {
			dao.boardDetail(b_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
