package adminowner.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminowner.admin.model.service.AdminService;
import adminowner.admin.model.vo.AdminIndex;
import adminowner.admin.model.vo.Notice;

/**
 * Servlet implementation class GoAdminNotice
 */
@WebServlet("/adminNotice.ad")
public class GoAdminNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoAdminNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminIndex ai = new AdminService().adminIndex();
		ArrayList<Notice> nList = new AdminService().selectNList();
		
		if(nList!=null && ai!=null) {
			request.setAttribute("nList",nList);
			request.setAttribute("ai", ai);
			request.getRequestDispatcher("views/adminowner/admin/notice.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "공지사항 리스트 조회 실패");
//			오류페이지  보내주기.
			//			request.getRequestDispatcher()
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
