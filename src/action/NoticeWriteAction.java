package action;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.notice.NoticeDTO;
import jeju.notice.NoticeDAO;

import controller.DBConnectionMgr;
import jeju.user.UserDTO;

public class NoticeWriteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		/*
		 * request.setCharacterEncoding("utf-8"); NoticeDTO article=new NoticeDTO();
		 * article.setNotice_no(Integer.parseInt(request.getParameter("notice_no")));
		 * 
		 * article.setNotice_title(request.getParameter("notice_title"));
		 * System.out.println(request.getParameter("notice_title")+ "ㄴㅇㄹㄴㄷㅀ");
		 * 
		 * article.setNotice_content(request.getParameter("notice_content"));
		 * System.out.println(request.getParameter("notice_content")+ "ㄴㅇㄹㄴㄷㅀ");
		 * article.setNotice_date(new Timestamp(System.currentTimeMillis()));//작성날짜
		 * 
		 * 
		 * NoticeDAO dbPro=new NoticeDAO(); dbPro.insertArticle(article);
		 */
		
		return "/Notice/noticeWrite.jsp";
	}

}
