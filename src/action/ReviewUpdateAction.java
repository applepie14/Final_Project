package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.review.*;

public class ReviewUpdateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		System.out.println("수정할 review번호 => "+ review_no);
		
		request.setCharacterEncoding("UTF-8");
		ReviewDAO dbPro = new ReviewDAO();
		ReviewDTO review = dbPro.updateGetReview(review_no);
		
		request.setAttribute("review", review);
		ReviewDTO reviewArticle = new ReviewDTO();
		
		return "/Review/Review_Update.jsp";
	}

}
