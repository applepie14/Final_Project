package action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jeju.review.ReviewDAO;
import jeju.review.ReviewDTO;

public class ReviewUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);

		// 파일 업로드
		String path = request.getServletContext().getRealPath("/assets/review_img"); // 저장경로
		// String path="http://106.10.39.121:8080/Review_Img/";

		// 업로드 위치
		int maxSize = 1024 * 1024 * 50; // 50MB
		String enc = "utf-8";
		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); // 덮어씌우기
		MultipartRequest upload = new MultipartRequest(request, path, maxSize, enc, dp);

		int review_no = Integer.parseInt(upload.getParameter("review_no"));
		String review_title = upload.getParameter("review_title");
		String review_content = upload.getParameter("review_content");
		String review_place = upload.getParameter("review_place");
		String existing_file = upload.getParameter("existing_file");

			/*
			review.setReview_no(Integer.parseInt(upload.getParameter("review_no")));
			review.setReview_title(upload.getParameter("review_title"));
			// review.setUser_nickname((String)session.getAttribute("email"));
			review.setReview_content(upload.getParameter("review_content")); 
			// review.setReview_date(new Timestamp(System.curSrentTimeMillis()));
			review.setReview_place(upload.getParameter("review_place"));
			*/
			

		ReviewDTO review = new ReviewDTO();
		review.setReview_no(review_no);
		review.setReview_title(review_title);
		review.setReview_content(review_content);
		review.setReview_place(review_place);
			
		Enumeration<String> fileNames = upload.getFileNames();
		if (fileNames.hasMoreElements()) {
			String fileName = fileNames.nextElement();
			String updateFile = upload.getFilesystemName(fileName);

			if (updateFile == null) {
				review.setReview_img(existing_file);
			} else {
				review.setReview_img(updateFile);
			}
		}

		ReviewDAO dbPro = new ReviewDAO();
		int update = dbPro.updateReview(review);

		request.setAttribute("update", update);

		// int update = dbPro.updateReview(review);

		// request.setAttribute("update", update);
		// dbPro.insertReview(review, (String)session.getAttribute("email"));

		return "/Review/Review_UpdatePro.jsp";
	}

}
