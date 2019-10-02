package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.user.UserDAO;

public class EmailCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String user_email = request.getParameter("user_email");

		UserDAO dao = new UserDAO();
		int check = dao.checkId(user_email);
//		System.out.println("들어온 이메일 : " + user_email);
//		System.out.println("데이터 " + check);
		
		request.setAttribute("check", check);
		return "/Register/emailCheck.jsp";
	}

}
