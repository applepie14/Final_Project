package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

// 글쓰기폼(writeForm.jsp에서 글쓰기버튼을 누른경우)
//추가
import jeju.notice.*;
import java.sql.Timestamp;//추가할 부분(시간)
import java.util.Enumeration;

public class NoticeModifyProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int update = 0; // 메소드();
		String url = "";

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
	
		//파일업로드
		String path = request.getServletContext().getRealPath("/assets/notice_upload"); // 저장경로
	
		// 업로드 위치
		int maxSize = 1024 * 1024 * 50; // 50MB
		String enc = "utf-8";
		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); // 덮어씌우기
		MultipartRequest upload = new MultipartRequest(request, path, maxSize, enc, dp);
		
		int notice_no = Integer.parseInt(upload.getParameter("notice_no"));
		String notice_pageNum = upload.getParameter("pageNum");
		String notice_title = upload.getParameter("subject");
		String notice_content = upload.getParameter("message");
		String existing_file = upload.getParameter("existing_file");
		System.out.println(upload.getParameter("existing_file"));
	
		  NoticeDTO article = new NoticeDTO();// 데이터 담을 객체
		  article.setNotice_no(notice_no); 
		  article.setNotice_title(notice_title);
		  article.setNotice_content(notice_content); 
		  article.setNotice_file(existing_file);
		 
		  Enumeration<String> fileNames = upload.getFileNames(); 
			if (fileNames.hasMoreElements()) {
				String fileName = fileNames.nextElement();
				String updateFile = upload.getFilesystemName(fileName);
				if (updateFile == null) {
					article.setNotice_file(existing_file);
				} else {
					article.setNotice_file(updateFile);
				}
			}
		NoticeDAO dbPro = new NoticeDAO();
	    update = dbPro.updateArticle(notice_title, notice_content, article.getNotice_file(), notice_no);

		request.setAttribute("update", update);
		if(update == 1) {
			url ="/noticeDetail.do?notice_no"+notice_no;
		}
		return url;
	}
}
