package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.review.*;
import java.sql.*;

public class ReviewDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
				
		ReviewDTO review = new ReviewDTO();
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		System.out.println("ReviewDeleteProAction.do의 review_no => " + review_no);
		
		ReviewDAO dbPro = new ReviewDAO();
		
		dbPro.deleteReview(review_no);
		request.setAttribute("review_no", review_no);
		
		return "/Review/Review_DeletePro.jsp";
	}

}
