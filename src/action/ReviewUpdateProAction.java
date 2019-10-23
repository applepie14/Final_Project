package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.review.*;
import java.sql.*;

public class ReviewUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
				
		ReviewDTO review = new ReviewDTO();
		review.setReview_no(Integer.parseInt(request.getParameter("review_no")));
		review.setReview_title(request.getParameter("review_title"));
		// review.setUser_nickname((String)session.getAttribute("email"));
		review.setReview_content(request.getParameter("review_content"));
		// review.setReview_date(new Timestamp(System.currentTimeMillis()));
		review.setReview_place(request.getParameter("review_place"));
		// review.setReview_like_count(0);
	
		
		ReviewDAO dbPro = new ReviewDAO();
		int update = dbPro.updateReview(review);
		
		request.setAttribute("update", update);
		// dbPro.insertReview(review, (String)session.getAttribute("email"));
		
		return "/Review/Review_UpdatePro.jsp";
	}

}