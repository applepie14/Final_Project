package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.notice.NoticeDAO;
import jeju.notice.NoticeDTO;
import jeju.plan.PlanDAO;
import jeju.plan.PlanDTO;

public class PlanModifyProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int update = 0; // 메소드();
		String url = "";
		// 값을 입력을 받아서 BoardDTO에 저장->테이블에 저장하는 구문
				// 한글처리
				request.setCharacterEncoding("utf-8");
				HttpSession session = request.getSession(true);
				// 추가
				int plan_no = Integer.parseInt(request.getParameter("plan_no"));
				String pageNum = request.getParameter("pageNum");

				PlanDTO article = new PlanDTO();// 데이터 담을 객체
				article.setPlan_no(plan_no);

				//article.setNotice_no(Integer.parseInt(request.getParameter("notice_no"))); 
			    article.setPlan_title( request.getParameter("plan_title"));
			    System.out.println(request.getParameter("plan_title"));
			    
				article.setPlan_theme(request.getParameter("theme"));
				System.out.println(request.getParameter("theme"));
				
				article.setPlan_gender( request.getParameter("gender"));
				System.out.println(request.getParameter("gender"));
				
				
				article.setPlan_period(Integer.parseInt(request.getParameter("day")));
				System.out.println(request.getParameter("day"));

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
				System.out.println(intTags.length);

				
				article.setPlan_startdate( request.getParameter("date"));
				
				System.out.println(request.getParameter("date"));
				article.setPlan_content("  ");
				article.setPlan_date(new Timestamp(System.currentTimeMillis()));//작성날짜
				article.setPlan_like_count(0);
				article.setPlan_public(request.getParameter("plan_public")=="off" ? "N": "Y");
				article.setPlan_save(request.getParameter("plan_save")=="on" ? "Y": "N"); 
				System.out.println(request.getParameter("plan_public"));
				System.out.println(request.getParameter("plan_save"));
				
				article.setPlan_nop(Integer.parseInt(request.getParameter("p")));
				System.out.println(request.getParameter("p"));
				
				PlanDAO dbPro = new PlanDAO();
				update = dbPro.updateArticle(article,(String)session.getAttribute("email"),intTags);

				request.setAttribute("update", update);
				if(update == 1) {
					url ="/planDetail.do?plan_no"+plan_no;
				}

		   
			return url;
	}

}
