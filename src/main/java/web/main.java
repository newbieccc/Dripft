package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.mainBoardListDAO;
import dto.BoardViewDTO;
import dto.NoticeViewDTO;

@WebServlet("/main")
public class main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public main() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		mainBoardListDAO dao = new mainBoardListDAO();

		try {
			List<BoardViewDTO> bBoardList = dao.mainBest();
			List<BoardViewDTO> boardList = dao.mainBoard();
			List<NoticeViewDTO> noticeList = dao.mainNotice();
			request.setAttribute("bboard", bBoardList);
			request.setAttribute("board", boardList);
			request.setAttribute("notice", noticeList);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("./main.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
