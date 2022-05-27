package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dto.NoticeDTO;

@WebServlet("/noticeList")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageNo = 1;
		if(request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		NoticeDAO dao = new NoticeDAO(); //DAO -> DB를 사용해 데이터를 조작하는 기능을 전담하도록 만든 오브젝트
		List<NoticeDTO> noticeList = dao.noticeList(pageNo * 10 - 10); //DTO -> 계층간 데이터 교환이 이루어 질 수 있도록 하는 객체
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("./notice.jsp");
		request.setAttribute("list", noticeList);
		request.setAttribute("totalcount", noticeList.get(0).getTotalcount());
		request.setAttribute("pageNo", pageNo);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
