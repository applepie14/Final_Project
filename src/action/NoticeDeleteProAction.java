package action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.notice.*;

public class NoticeDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
		
		NoticeDTO article = new NoticeDTO();
		int notice_no=Integer.parseInt(request.getParameter("notice_no"));
		String pageNum=request.getParameter("pageNum");
		
		NoticeDAO dbPro = new NoticeDAO();
		
		dbPro.deleteArticle(notice_no);
		
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("notice_no", notice_no);
		
		/*
		int delete = 0;
		String url = "";
	 
		int notice_no=Integer.parseInt(request.getParameter("notice_no"));
		String pageNum=request.getParameter("pageNum");

		NoticeDTO article = new NoticeDTO();// 데이터 담을 객체

		String title = request.getParameter("subject");
		String content = request.getParameter("message");

		NoticeDAO dbPro = new NoticeDAO();
		delete = dbPro.deleteArticle(notice_no);

		request.setAttribute("pageNum",pageNum);
		request.setAttribute("delete", delete);
		if(delete == 1) {
			url ="/noticeDeletePro.do?notice_no"+notice_no;
		}
		*/
		
		return "/Notice/noticeDeletePro.jsp";
}
}
