package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.notice.NoticeDAO;
import jeju.notice.NoticeDTO;

public class NoticeModifyAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	// TODO Auto-generated method stub
		
		
	  int notice_no=Integer.parseInt(request.getParameter("notice_no"));
	  System.out.println(notice_no);
	   String pageNum=request.getParameter("pageNum");
	 
	   request.setCharacterEncoding("utf-8");
	   NoticeDAO dbPro=new NoticeDAO();
	   NoticeDTO article=dbPro.updateGetArticle(notice_no);//조회수가 증가X
	   
	   //2.서버의 메모리에 저장
	   request.setAttribute("pageNum", pageNum);
	   request.setAttribute("article", article);
		
	   NoticeDTO noticeArticle=new NoticeDTO();//데이터 담을 객체

//	   noticeArticle.setNotice_title(request.getParameter("notice_title"));
//	   noticeArticle.setNotice_content(request.getParameter("notice_content"));
//	
//	     int update = 0; //메소드();
	   
		return "/Notice/noticeModify.jsp";
	}

}
