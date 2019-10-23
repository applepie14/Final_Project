package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.notice.NoticeDTO;
import jeju.notice.NoticeDAO;

public class NoticeDetailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		 //String notice_no = request.getParameter("notice_no");
		/* int num = Integer.parseInt(request.getParameter("num")); */
	
//	      String pageNum = request.getParameter("pageNum");
	      
	      NoticeDAO dbPro = new NoticeDAO();
	      NoticeDTO article = dbPro.getArticle(notice_no);
	      
	    
	      // 2. 처리결과를 메모리에 저장
	      request.setAttribute("notice_no", notice_no);
	 //    request.setAttribute("pageNum", pageNum);
	      request.setAttribute("article", article); 
	      // ref, re_step, re_level이 article에 포함되어 있음

		
		return "/Notice/noticeDetail.jsp";
	}

}
