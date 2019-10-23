package action;

import java.io.PrintWriter;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.user.SHA256;
import jeju.user.UserDAO;

public class ActivateAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String code = request.getParameter("code");
		String url = "/Register/Activate.jsp";

		UserDAO userDAO = new UserDAO();
		String email = null;
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("email") != null) {
			email = (String) session.getAttribute("email");
		}

		String userEmail = userDAO.ActivateSelect(email)[0];
		
		// 주소로 입력받은 인증 값이 같은지 비교
		boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
		if(rightCode == true) {
			userDAO.ActivateUpdate(email);
			session.setAttribute("activate", userDAO.ActivateSelect(email)[1]);
		}
		
		return url;
	}

}
