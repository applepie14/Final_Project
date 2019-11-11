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
		return "/Notice/noticeWrite.jsp";
	}

}
