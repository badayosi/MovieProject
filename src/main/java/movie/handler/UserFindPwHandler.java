package movie.handler;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.User;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class UserFindPwHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("sdafsdf");
		String id = req.getParameter("id");
		String userEmail = req.getParameter("email");
		
		User user = new User();
		user.setUserId(id);
		user.setEmail(userEmail);
		
		String pw = "";
		
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		
		user.setPassword(pw);
		
		System.out.println(user.toString());
		
		UserService service = UserService.getInstance();
		User findUser = service.findPw(user);
		
		
		if(findUser==null){
			req.setAttribute("result", "아이디 또는 이메일을 확인해 주세요");
		}else{
			System.out.println(findUser.toString());
			service.updatePw(user);
			HtmlEmail(user);
			req.setAttribute("result", "이메일에서 임시 비밀번호를 확인해 주세요");
		}
		
		
		return "findIdPw.jsp";
	}
	public void HtmlEmail(User user){
		Properties p = System.getProperties();

		p.put("mail.smtp.starttls.enable", "true");// gmail은 무조건 true 고정

		p.put("mail.smtp.host", "smtp.gmail.com");// smtp 서버 주소

		p.put("mail.smtp.auth", "true");// gmail은 무조건 true 고정

		p.put("mail.smtp.port", "587");// gmail 포트

		Authenticator auth = new MyAuthentication();

		// session 생성 및  MimeMessage생성

		Session session = Session.getDefaultInstance(p, auth);

		MimeMessage msg = new MimeMessage(session);

		try {

			// 편지보낸시간

			msg.setSentDate(new Date());

			InternetAddress from = new InternetAddress();



			from = new InternetAddress("dlrjsak@gmail.com");

			// 이메일 발신자

			msg.setFrom(from);



			// 이메일 수신자

			InternetAddress to = new InternetAddress(user.getEmail());

			msg.setRecipient(Message.RecipientType.TO, to);

			// 이메일 제목

			msg.setSubject("임시 비밀번호 입니다.", "UTF-8");

			// 이메일 내용
			String msg1 = "";
			
			msg1 = "롯데 시네마 임시 비밀번호 입니다.";
			msg1 += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg1 += "<h3 style='color: blue;'>";
			msg1 += user.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg1 += "<p>임시 비밀번호 : ";
			msg1 += user.getPassword() + "</p><br></div>";
			
			
			msg.setText(msg1, "UTF-8");

			// 이메일 헤더

			msg.setHeader("content-Type", "text/html");

			// 메일보내기

			javax.mail.Transport.send(msg);

		} catch (AddressException addr_e) {

			addr_e.printStackTrace();

		} catch (MessagingException msg_e) {

			msg_e.printStackTrace();
		}

	}
	class MyAuthentication extends Authenticator {
		
		PasswordAuthentication pa;	
	
		public MyAuthentication() {
		
			String id = "dlrjsak@gmail.com";// 구글 ID
	
			String pw = "idcokamxzcrlvwrg";// 구글 비밀번호
	
			// ID와 비밀번호를 입력한다.
	
			pa = new PasswordAuthentication(id, pw);
	
		}

		// 시스템에서 사용하는 인증정보
	
		public PasswordAuthentication getPasswordAuthentication() {
	
			return pa;
	
		}

	}
}
