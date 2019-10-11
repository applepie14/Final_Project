package action;

import java.util.Arrays;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeju.user.Gmail;
import jeju.user.UserDAO;

public class PassWordTempProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int check = 0;
		
		UserDAO userDao = new UserDAO();
		
		// info[0]은 user테이블의 email, info[1]은 login테이블의 email, info[2]는 이름
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		String[] info = userDao.pwdTempInfo(email,name);		
		
		// 둘 중 하나라도 값이 null이면 false, 둘 다 값이 있으면 true
		boolean temp = (info[0]==null || info[1]==null)? false : true ;
		request.setAttribute("temp", temp);
		
		if(temp == true) {
			// user의 이메일과 login의 이메일이 같고 이름이 있다면
			
			// 임시 비밀번호 생성
			char pwCollection[] = new char[] {
                    '1','2','3','4','5','6','7','8','9','0',
                    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                    '!','@','#','$','%','^','&','*','(',')','~','-','_','+','=','?'
                    };//배열에 선언
			String ranPw = ""; 
			for (int i = 0; i < 10; i++) {
				int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다.
				ranPw += pwCollection[selectRandomPw];
			}
			System.out.println(ranPw);
			//출처: https://bbaksae.tistory.com/5 [QRD]
			
			// 임시 비밀번호를 DB에 Update
			userDao.passwordUpdate("user", ranPw, info[1]);
			check = userDao.passwordUpdate("login", ranPw, info[1]);
			
			// 사용자에게 보낼 메시지를 기입합니다.
			String from = "jeju131316@gmail.com";
			String to = info[1]; // info[1]은 email
			String subject = "그날, 우리의 제주 임시비밀번호 발급";
			String content = "<p>아래의 임시 비밀번호로 로그인하시길 바랍니다.</p>"
					+ "<p style='font-size: 25px; font-weight: 900;'>" + ranPw + "</p>"
					+ "<p>추후 로그인 정보를 변경하십시오</p>";
			// SMTP에 접속하기 위한 정보를 기입합니다.

			Properties p = new Properties();
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try{
			    Authenticator auth = new Gmail();
			    Session ses = Session.getInstance(p, auth);
			    ses.setDebug(true);
			    MimeMessage msg = new MimeMessage(ses); 
			    msg.setSubject(subject);
			    Address fromAddr = new InternetAddress(from);
			    msg.setFrom(fromAddr);
			    Address toAddr = new InternetAddress(to);
			    msg.setRecipient(Message.RecipientType.TO, toAddr);
			    msg.setContent(content, "text/html;charset=UTF-8");
			    Transport.send(msg);
			} catch(Exception e){
			    e.printStackTrace();
			}
			request.setAttribute("check", check);	
		}
		
		return "/Mypage/pwdtempPro.jsp";
	}
}
