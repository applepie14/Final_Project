package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.plan.PlanDAO;
import jeju.plan.PlanDTO;

public class PlanDeleteProAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
				
		int plan_no = Integer.parseInt(request.getParameter("plan_no"));
		System.out.println("PlanDeleteProAction.do의 plan_no => " + plan_no);
		
		PlanDAO dbPro = new PlanDAO();
		
		dbPro.deletePlan(plan_no);
		request.setAttribute("plan_no", plan_no);
		
		return "/Plan/PlanDeletePro.jsp";
	}
}
