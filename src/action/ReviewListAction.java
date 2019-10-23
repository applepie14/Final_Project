package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import jeju.review.ReviewDAO;

public class ReviewListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		System.out.println("ReviewListAction 부분");
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search");
		String searchtext = request.getParameter("searchtext");
		
		
		int count=0; // 총 레코드 수
		List reviewList = null; // 화면에 출력할 레코드를 저장할 변수
		
		ReviewDAO dbPro = new ReviewDAO();
		count = dbPro.getReviewSearchCount(search, searchtext);
		System.out.println("현재 검색된 레코드 개수(count) => " + count);
		
		Hashtable<String, Integer> pgList = dbPro.pageList(pageNum, count);
		
		if(count > 0) {
			reviewList = dbPro.getReviewArticles(pgList.get("startRow"),
					   							 pgList.get("pageSize"), 
					   							 search, searchtext);
		} else {
			reviewList = Collections.EMPTY_LIST; // 아무것도 없는 빈 list 객체 반환
		}
		
		request.setAttribute("search", search); // 검색분야
		request.setAttribute("searchtext", searchtext); // 검색어
		request.setAttribute("pgList", pgList); // 페이징처리 10개 정보
		request.setAttribute("reviewList", reviewList); // ${articleList}
		
		return "/Review/Review_List.jsp";
	}

}
