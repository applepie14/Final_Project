package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.user.LoginDTO;
import jeju.user.SHA256;
import jeju.user.UserDAO;
import jeju.user.UserDTO;

public class RegisterProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String url =""; // 회원가입 성공 시 넘어갈 회면을 담는 String
		request.setCharacterEncoding("UTF-8");

		UserDAO dao = new UserDAO();
		UserDTO user = new UserDTO();
		LoginDTO login = new LoginDTO();

		// 회원 테이블에 값 집어넣음
		user.setUser_name(request.getParameter("user_name"));
		user.setUser_email(request.getParameter("user_email"));
		user.setUser_password(request.getParameter("user_password"));
		user.setUser_gender(request.getParameter("user_gender"));
		user.setUser_phone(request.getParameter("user_phone"));
		user.setUser_birth(request.getParameter("user_birth"));
		user.setUser_intro(request.getParameter("user_intro"));
		user.setUser_nickname(request.getParameter("user_nickname"));
		user.setUser_point(0);
		user.setAccess(SHA256.getSHA256(request.getParameter("user_name")));
		// 입력받은 회원의 이메일 주소에 맞게 salt 생성
		user.setActivate("N");
		
		boolean check = dao.userInsert(user);

		if(check == true) {
			// 로그인 테이블에 값 집어넣음
			login.setUser_email(request.getParameter("user_email"));
			login.setUser_password(request.getParameter("user_password"));
			login.setUser_point(0);
			boolean check2 = dao.loginInsert(login);
			
			// login 테이블에 값 집어넣음
			url = "sendEmail.do";
		}else {
			url = "registerform.do";
		}
		return url;
	}

}
