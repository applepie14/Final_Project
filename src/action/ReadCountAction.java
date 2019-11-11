package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.find.FindDAO;
import jeju.find.FindDTO;

public class ReadCountAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int company_no = Integer.parseInt(request.getParameter("company_no"));
		
		FindDAO dao = new FindDAO();
		FindDTO dto = new FindDTO();
		
		int update = dao.updateCount(company_no);
		System.out.println("ReadCountAction의 company_no => " + company_no);
		System.out.println("ReadCountAction의 update => " + update);
	
		FindDTO company = dao.readCount(company_no);

		request.setAttribute("update", update);
		request.setAttribute("company", company);
		
		
		return "/Find/ReadCount.jsp";
	}

}
