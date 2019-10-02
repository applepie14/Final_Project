package action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.find.*;

public class FindListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String pageNum = request.getParameter("pageNum");
		// 추가(검색분야, 검색어)
		String search = request.getParameter("search");
		String searchtext = request.getParameter("searchtext");
		System.out.println("ListAction의 매개변수 확인");
		System.out.println("pageNum = "+pageNum+", search = "+search+", searchtext = " +searchtext);
		
		int count=0; // 총 레코드 수
		List companyList=null; // 화면에 출력할 레코드를 저장할 변수

		FindDAO dbPro = new FindDAO();
		count = dbPro.getCompanySearchCount(search, searchtext); // sql구문에 따라서 결과가 달라짐
		System.out.println("현재 검색된 레코드 개수(count) => " + count);

		Hashtable<String, Integer> pgList = dbPro.pageList(pageNum, count);

		if (count > 0) {
			System.out.println(pgList.get("startRow")+", "+pgList.get("endRow"));
			
			companyList = dbPro.getCompanyArticles(pgList.get("startRow"),
												   pgList.get("pageSize"), 
												   search, searchtext);
			 
		} else {	// count =0
			companyList=Collections.EMPTY_LIST; //아무것도 없는 빈 list객체 반환
		}

		// 2. 처리한 결과를 공유(서버메모리에 저장) -> 이동할 페이지에 공유해서 사용(request객체)
		// request.getAttribute("currentPage"(키명)) -> ${키명}
		request.setAttribute("search", search); // 검색분야
		request.setAttribute("searchtext", searchtext); // 검색어
		request.setAttribute("pgList", pgList); // 페이징처리 10개 정보
		request.setAttribute("companyList", companyList); // ${articleList}
		
		
		return "/Find/Find_List.jsp";
	}

}

