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

		UserDAO userDAO = new UserDAO();
		String email = null;
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("userID") != null) {
			email = (String) session.getAttribute("email");
		}

		if(email == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'userLogin.jsp'");
			script.println("</script>");
			script.close();
		}

		String userEmail = userDAO.ActivateSelect(email)[0];
		boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
		if(rightCode == true) {
			userDAO.ActivateUpdate(email);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('인증에 성공했습니다.');");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();		
			
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 코드입니다.');");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();		
			
		}		
		
		return "/Register/Activate.jsp";
	}

}
