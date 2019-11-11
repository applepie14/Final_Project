package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.find.*;

import java.sql.*;

public class FindDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
				
		FindDTO find = new FindDTO();
		int company_no = Integer.parseInt(request.getParameter("company_no"));
		System.out.println("FindDeleteProAction.do의 company_no => " + company_no);
		
		FindDAO dbPro = new FindDAO();
		
		dbPro.deleteCompany(company_no);
		request.setAttribute("company_no", company_no);
		
		return "/Find/Find_DeletePro.jsp";
	}
}
