package action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.find.FindDAO;
import jeju.find.FindDTO;

public class FindUpdateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		int company_no = Integer.parseInt(request.getParameter("company_no"));
		System.out.println("수정할 company번호 => "+ company_no);
		
		request.setCharacterEncoding("UTF-8");
		FindDAO dbPro = new FindDAO();
		FindDTO company = dbPro.updateGetCompany(company_no);
		ArrayList tags = dbPro.updateGetCompanyTags(company_no); 
		
		request.setAttribute("company", company);
		request.setAttribute("tags",tags);
		
		return "/Find/Find_Update.jsp";
	}

}
