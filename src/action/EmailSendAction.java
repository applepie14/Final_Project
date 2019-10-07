package action;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jeju.user.Gmail;
import jeju.user.SHA256;
import jeju.user.UserDAO;

public class EmailSendAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String url = "/Register/sendEmail.jsp";
		
		UserDAO userDao = new UserDAO();
		String email = null;
		
		HttpSession session = request.getSession(true);
		if(session.getAttribute("email") != null) {
			email = (String) session.getAttribute("email");
			System.out.println(email);
		}
		
		String emailChecked = userDao.ActivateSelect(email)[1]; // user[1]은 Activate

		// 사용자에게 보낼 메시지를 기입합니다.
		String host = "localhost:8090/JEJU3/";
		String from = "jeju131316@gmail.com";
		String to = userDao.ActivateSelect(email)[0]; // user[0]은 email
		String subject = "회원가입에 대한 인증 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +
			"<br><a href='" + host + "activate.do?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
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
		
		System.out.println(url);
		return url;
	}

}
