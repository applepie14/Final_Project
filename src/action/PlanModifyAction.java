package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.plan.PlanDAO;
import jeju.plan.PlanDTO;

public class PlanModifyAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		int plan_no=Integer.parseInt(request.getParameter("plan_no"));
		 System.out.println(plan_no);
		 String pageNum=request.getParameter("pageNum");
		 
		 request.setCharacterEncoding("utf-8");
		   PlanDAO dbPro=new PlanDAO();
		   PlanDTO article=dbPro.updateGetArticle(plan_no);//조회수가 증가X
		 ArrayList<Integer> tags= dbPro.getTagArticle2(plan_no);
		 //2.서버의 메모리에 저장
		   request.setAttribute("pageNum", pageNum);
		   request.setAttribute("article", article);
		   request.setAttribute("tags", tags);
		   
		   
		   PlanDTO planArticle=new PlanDTO();//데이터 담을 객체
		return "/Plan/planModify.jsp";
	}

}
