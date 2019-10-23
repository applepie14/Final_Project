package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 글쓰기폼(writeForm.jsp에서 글쓰기버튼을 누른경우)
//추가
import jeju.notice.*;
import java.sql.Timestamp;//추가할 부분(시간)

public class NoticeModifyProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int update = 0; // 메소드();
		String url = "";

		// 값을 입력을 받아서 BoardDTO에 저장->테이블에 저장하는 구문
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 추가
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		String pageNum = request.getParameter("pageNum");

		NoticeDTO article = new NoticeDTO();// 데이터 담을 객체

		String title = request.getParameter("subject");
		String content = request.getParameter("message");

		NoticeDAO dbPro = new NoticeDAO();
		update = dbPro.updateArticle(title, content, notice_no);

		request.setAttribute("update", update);
		if(update == 1) {
			url ="/noticeDetail.do?notice_no"+notice_no;
		}
		
		return url;
	}
}
