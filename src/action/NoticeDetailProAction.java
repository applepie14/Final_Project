package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import jeju.notice.NoticeDAO;
import jeju.notice.NoticeDTO;

public class NoticeDetailProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
	
	
		
		return "/Notice/noticeDetailPro.jsp";
	}

}
