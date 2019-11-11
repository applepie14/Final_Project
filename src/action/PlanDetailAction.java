package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.notice.NoticeDAO;
import jeju.notice.NoticeDTO;
import jeju.plan.PlanDAO;
import jeju.plan.PlanDTO;
import jeju.plan.Plan_TagDTO;

public class PlanDetailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int plan_no = Integer.parseInt(request.getParameter("plan_no"));
		 PlanDAO dbPro = new PlanDAO();
	     PlanDTO article = dbPro.getArticle(plan_no);
	     ArrayList<String>  tags=dbPro.getTagArticle(plan_no);
	  // 2. 처리결과를 메모리에 저장
	      request.setAttribute("plan_no", plan_no);
	      request.setAttribute("article", article); 
	      request.setAttribute("tags", tags);
	      
		return "/Plan/schedule.jsp";
	}

}
