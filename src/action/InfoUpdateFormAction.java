package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.user.UserDAO;
import jeju.user.UserDTO;

public class InfoUpdateFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(true);
		String email = (String) session.getAttribute("email");
		
		UserDAO dao = new UserDAO();
		UserDTO user = dao.loadInfo(email);
		
		System.out.println(user);
		if(user != null) {
			System.out.println(user.getUser_name());
		}else {
			System.out.println("못불러옴");
		}
		request.setAttribute("user", user);

		return "/Mypage/infoChange.jsp";
	}

}
