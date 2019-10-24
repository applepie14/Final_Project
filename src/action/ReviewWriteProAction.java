package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jeju.review.*;

import java.io.File;
import java.sql.*;

public class ReviewWriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);

		// 파일 업로드
		String path = request.getServletContext().getRealPath("/assets/review_img"); // 저장경로
		// 업로드 위치
		int maxSize = 1024 * 1024 * 50; // 50MB
		String enc = "utf-8";
		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); // 덮어씌우기
		MultipartRequest upload = new MultipartRequest(request, path, maxSize, enc, dp);
		File file = null;

		String sysName = upload.getFilesystemName("review_img"); // 업로드 할 때 사용되는 파일명
		String orgName = upload.getOriginalFileName("review_img"); // 원래 파일명
		String type = upload.getContentType("review_img");
		System.out.println(type);

		System.out.println(sysName);

		type = type.split("/")[0];
		if (!type.equals("image")) {
			file = upload.getFile("review_img");
			file.delete();
			System.out.println("확장자 타입이 맞지 않습니다");
		}

		String filepath = path + "/" + sysName;
		System.out.println("filepath" + filepath);

		// 파일 업로드

		ReviewDTO review = new ReviewDTO();

//		review.setReview_title(request.getParameter("review_title"));
//		review.setUser_nickname((String)session.getAttribute("email"));
//		review.setReview_content(request.getParameter("review_content"));
//		review.setReview_date(new Timestamp(System.currentTimeMillis()));
//		review.setReview_place(request.getParameter("review_place"));
//		review.setReview_img(request.getParameter("review_img"));
//		review.setReview_like_count(0);

		review.setReview_title(upload.getParameter("review_title"));
		review.setUser_nickname((String) session.getAttribute("email"));
		review.setReview_content(upload.getParameter("review_content"));
		review.setReview_date(new Timestamp(System.currentTimeMillis()));
		review.setReview_place(upload.getParameter("review_place"));
		review.setReview_img(sysName);
		System.out.println(sysName);
		review.setReview_like_count(0);

		ReviewDAO dbPro = new ReviewDAO();
		dbPro.insertReview(review, (String) session.getAttribute("email"));

		return "/Review/Review_WritePro.jsp";
	}

}
