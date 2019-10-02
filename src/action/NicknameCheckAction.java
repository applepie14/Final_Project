package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.user.UserDAO;

public class NicknameCheckAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String user_nickname = request.getParameter("user_nickname");

		UserDAO dao = new UserDAO();
		int check = dao.checkNick(user_nickname);
		System.out.println("들어온 닉네임 : " + user_nickname);
		System.out.println("데이터 " + check);
		
		request.setAttribute("check", check);
		return "/Register/nicknameCheck.jsp";
	}

}
