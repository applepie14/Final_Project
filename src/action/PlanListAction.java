package action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.plan.PlanDAO;

public class PlanListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//String pageNum = request.getParameter("pageNum");//pageNum받아오기 //
		//String imsi = request.getParameter("imsi")==null ? "" : request.getParameter("imsi"); 출처: https://webprogrammer.tistory.com/844 [개발자(開發者) a developer]
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		String palnsubject= request.getParameter("palnsubject")==null ? "" :request.getParameter("palnsubject");
		String theme = request.getParameter("theme")==null ? "" : request.getParameter("theme");
		String gender= request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String[] tags= new String[6];
		if (request.getParameterValues( "tags" )==null) {
			for( int i=0;i<tags.length; i++){
				tags[i] = "-500";
				}
			}
		else
			tags = request.getParameterValues( "tags" );
		
		System.out.println("tags[0]"+tags[0]);
		
		int[] intTags = null;
		if( tags != null ){//int 배열 만들기
		intTags = new int[ tags.length ];
			for( int i=0;i<tags.length; i++){
			intTags[i] = Integer.parseInt( tags[i] );
			}
		}
		
		String date = request.getParameter("date")==null ? "" : request.getParameter("date");
		//SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		int day=request.getParameter("day")==null ?  0: Integer.parseInt(request.getParameter("day"));
		int p=request.getParameter("p")==null ? 0:Integer.parseInt(request.getParameter("p"));
		System.out.println("PlanListAction의 매개변수 확인");
		System.out.println("pageNum = "+pageNum+", palnsubject = "+palnsubject+", theme = " +theme);
		System.out.println("date= "+date+", day = "+day+", p = "+p+" ,gender"+gender);
		
		
		
		
		int count=0; // 총 레코드 수
		List planList=null;//출력할 레코드 저장할 변수
		PlanDAO dbPro= new PlanDAO() ;
		count=dbPro.getPlanSearchCount(palnsubject, theme, intTags, date, day, p, gender);
		System.out.println("현재 검색된 레코드 개수(count) => " + count);
		
		Hashtable<String, Integer> pgList = dbPro.pageList(pageNum, count);
		
		if (count > 0) {
			System.out.println(pgList.get("startRow")+", "+pgList.get("endRow"));
			
			planList = dbPro.getPlanArticles(pgList.get("startRow"),
												   pgList.get("pageSize"), 
												   palnsubject, theme, intTags, date, day, p, gender);
			 
		} else {	// count =0
			planList=Collections.EMPTY_LIST; //아무것도 없는 빈 list객체 반환
		}
		
		
	    request.setAttribute("pageNum",pageNum);//검색분야
	    request.setAttribute("palnsubhect",palnsubject);//제목
	    request.setAttribute("pgList", pgList);//페이징처리 10개 정도
		request.setAttribute("planList", planList); // ${articleList}

		return "/Plan/schedule_board.jsp";
		
	}

}
