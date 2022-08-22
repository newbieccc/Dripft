package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/delCheck")
public class DelCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				if(request.getParameter("id") != null) {
					System.out.println(request.getParameter("id"));
					
					String id = request.getParameter("id");
					dao.JoinDAO dao = new dao.JoinDAO();
					int result = 1; //0없음, 1있음
					result = dao.idCheck(id);
					
					PrintWriter pw = response.getWriter();
					pw.print(result);//출력
				}
	}

}
