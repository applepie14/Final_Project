package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.user.UserDAO;
import jeju.user.UserDTO;

public class InfoUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(true);
		
		String phone = request.getParameter("user_phone");
		String birth = request.getParameter("user_birth");
		String intro = request.getParameter("user_intro");
		String email = (String) session.getAttribute("email");
		
		UserDAO dao = new UserDAO();
		int update = dao.updateInfo(phone, birth, intro, email);
				
		UserDTO user = dao.loadInfo(email);
		
		request.setAttribute("update", update);
		request.setAttribute("user", user);
		
		System.out.println(update);
		
		return "/Mypage/infoChangePro.jsp";
	}

}
