package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.user.*;

public class LoginProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String url= "/login/LoginPro.jsp";
		
		HttpSession session = request.getSession(true);
		
		UserDAO dao = new UserDAO();
		
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
//		System.out.println(email + " - 이메일");
		
		String name = dao.loginCheck(email, password); // user[0]
		String activate = dao.ActivateSelect(email)[1]; // user[1]
//		System.out.println(name + " - 이름");
//		System.out.println(name.equals(""));
		//②	처리할 결과를 이동할 페이지에 공유해서 사용할 수 있도록 저장한다(서버 메모리에 저장)
		
		System.out.println("name : " + name);
		System.out.println("activate : " + activate);
		
		if(name.equals("") == false) {
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("activate", activate);
		}
		
		return url;
	}
}