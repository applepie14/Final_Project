package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.user.UserDAO;

public class IdFindProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		UserDAO userDao = new UserDAO();
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		String email = userDao.idFind(name, phone);	
		
		request.setAttribute("email", email);

		return "/Mypage/idFindPro.jsp";
	}

}
