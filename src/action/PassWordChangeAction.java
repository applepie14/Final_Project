package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.user.UserDAO;

public class PassWordChangeAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		String url = "/Mypage/pwdchabge.jsp";

		HttpSession session = request.getSession(true);
		String email = (String)session.getAttribute("email");
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		
		System.out.println(email);
				
		UserDAO dao = new UserDAO();
		String c = dao.passwordConfirm(email);
		
		if(c.equals(old_password)) {
			int check = dao.passwordUpdate("login",new_password, email);
						
			if(check == 1) {
				dao.passwordUpdate("user", new_password, email);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호 변경이 되었습니다.새로운 비밀번호로 로그인하세요.');");
				script.println("location.href='login.do';");
				script.println("</script>");
				script.close();
				
				session.invalidate();
			}
		}
		
		return url;
	}

}
