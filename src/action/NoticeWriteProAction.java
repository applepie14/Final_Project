package action;

import java.io.File;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.notice.NoticeDAO;
import jeju.notice.NoticeDTO;
import jeju.review.ReviewDTO;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

public class NoticeWriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		NoticeDTO article = new NoticeDTO();
		/* article.setNotice_no(Integer.parseInt(request.getParameter("notice_no"))); */

		// 파일 업로드
		String path = request.getServletContext().getRealPath("/assets/notice_upload"); // 저장경로
		// 업로드 위치
		int maxSize = 1024 * 1024 * 50; // 50MB
		String enc = "utf-8";
		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); // 덮어씌우기
		MultipartRequest upload = new MultipartRequest(request, path, maxSize, enc, dp);
        File file=null;
		String sysName = upload.getFilesystemName("notice_file"); // 업로드 할 때 사용되는 파일명
		String orgName = upload.getOriginalFileName("notice_file"); // 원래 파일명
		String type= upload.getContentType("notice_file");
		System.out.println(type);
		System.out.println(sysName);

		type = type.split("/")[0];
		if (!type.equals("image")) {
			file = upload.getFile("notice_file");
			file.delete();
			System.out.println("확장자 타입이 맞지 않습니다");
		}
		
		String filepath = path + "/" + sysName;
		System.out.println("filepath" + filepath);
		// 파일 업로드

		article.setNotice_title(upload.getParameter("notice_title"));
		System.out.println(upload.getParameter("notice_title") + "제목");

		article.setNotice_content(upload.getParameter("notice_content"));
		System.out.println(upload.getParameter("notice_content") + "내용");
		
		article.setNotice_file(sysName);
		System.out.println(sysName + " >> 파일명");
		
		article.setNotice_date(new Timestamp(System.currentTimeMillis()));// 작성날짜

		NoticeDAO dbPro = new NoticeDAO();
		dbPro.insertArticle(article);
		return "/Notice/noticeWritePro.jsp";
	}

}
