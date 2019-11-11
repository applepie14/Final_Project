package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.find.*;

public class FindWriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);

		FindDTO company = new FindDTO();

		company.setCompany_title(request.getParameter("company_title"));
		company.setUser_nickname((String) session.getAttribute("name"));
		company.setCompany_startdate(request.getParameter("company_startdate"));
		company.setCompany_enddate(request.getParameter("company_enddate"));
		company.setCompany_theme(request.getParameter("company_theme"));
		company.setCompany_gender(request.getParameter("company_gender"));
		company.setCompany_content(request.getParameter("company_content"));
		company.setCompany_date(new Timestamp(System.currentTimeMillis()));

		String[] tags = new String[6];

		if (request.getParameterValues("tags") == null) {
			for (int i = 0; i < tags.length; i++) {
				tags[i] = "-500";
			}
		} else
			tags = request.getParameterValues("tags");
		System.out.println("tags[0]" + tags[0]);

		int[] intTags = null;
		if (tags != null) {// int 배열 만들기
			intTags = new int[tags.length];
			for (int i = 0; i < tags.length; i++) {
				intTags[i] = Integer.parseInt(tags[i]);
			}
		}
		System.out.println(intTags.length);
		System.out.println(request.getParameter("company_gender"));
		
		FindDAO dbPro = new FindDAO();
		dbPro.insertCompany(company,(String)session.getAttribute("email"), intTags);

		return "/Find/Find_WritePro.jsp";
	}

}
