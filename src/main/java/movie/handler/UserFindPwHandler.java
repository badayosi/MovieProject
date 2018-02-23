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
		User u = service.selectById(user.getUserId());
		User findUser = service.findPw(user);
		
		
		if(findUser==null){
			req.setAttribute("result", "아이디 또는 이메일을 확인해 주세요");
		}else{
			System.out.println(findUser.toString());
			service.updatePw(user);
			service.updatePw(findUser);
			HtmlEmail(u);
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
			String msg1 = "<div style='width:700px;background-color:#f1e3c4;margin:0 auto; padding:0;font:12px/160% Dotum,'돋움',serif; color:#101010;overflow:hidden;'>"
						+"<div style='height:70px;text-align:center;'>"
						+"<h1 style='margin:0px; padding:0px;'>"
						+"<a style='text-decoration:none; color:#555' target='_blank' href='http://localhost:8080/MovieProject/index.jsp'>"
						+"<img style='border:0; width:700px;' src=\'http://caching.lottecinema.co.kr//Media/WebAdmin/23339c901d7942cc826af0dd27360b90.gif\' alt=''>"
						+ "</a></h1></div>"
						+"<img style='border:0; width:700px;'  src=\'http://caching.lottecinema.co.kr//Media/WebAdmin/eacaf47c32e647eda0ca9d2ac8a7e9b4.jpg\' alt='신라리워즈 이미지'>"
						+"<div style='float:left; width:680px; background:#FFF; min-height:100px; margin:0 10px; padding:0; padding-bottom:10px;'>"
						+"<div style='margin:30px;line-height:200%'>"
						+"<p style='margin:0; padding:0;color:#666;'>안녕하십니까. 롯데시네마입니다. </p>"
						+"<p style='margin:0; padding:0;color:#666;'>"+user.getName()+"님의 임시비밀번호를 안내해 드립니다.</p></div>"
						+"<div style='background-color:#f9f7f4;border-top:1px solid #edeae6;border-bottom:1px solid #edeae6;padding:10px 0 5px 0;'>"
						+"<div style='margin:10px 30px 0 30px;'>"
						+"<p style='color:#333;'>아래의 임시 비밀번호로 로그인 하신 후에 타인에게 공개되지 않도록 비밀번호를 변경해 주시기 바랍니다.</p>"
						+"<div style='overflow:hidden;width:290px;margin:20px 0 30px 165px;'>"
						+"<span style='display:block; width:87px; height:40px; background:url(http://www.shilla.net/images/ko/seoul/email/emailPwd/tmpPwdText.gif); text-indent:-9999%; overflow:hidden;float:left;'>임시비밀번호</span>"
						+"<span style='float:right;width:185px;height:40px;background-color:#dbdbdb;font-size:20px;line-height:40px;text-align:center;font-family:Verdana;'>"+user.getPassword()+"</span>"
						+"</div></div></div>"
						+"<div style='margin:10px 30px 0 30px;padding:20px 0;text-align:center;'>"
						+"<a style='text-decoration:none; color:#555' target='_blank' href='http://localhost:8080/MovieProject/login/Login.jsp'><img style='border:0;' src='http://www.shilla.net/images/ko/seoul/email/emailPwd/loginBtn.gif' alt='로그인 버튼'></a>"
						+"</div></div>"
						+"<div style='width:700px;'>"
						+"<div style='float:left; overflow:hidden; margin:0px 40px; width:620px; height:100px;'>"
						+"<div style='float:left;width:134px;'>"
						+"<h2 style='margin:20px 0;'><a style='text-decoration:none; color:#555' target='_blank' href='http://localhost:8080/MovieProject/login/Login.jsp'><img style='border:0; width:150px;' src='http://www.lottecinema.co.kr/LCHS/Image/logo_footer.gif?v=17111301' alt=''></a></h2>"
						+"</div>"
						+"<div style='float:right;width:465px;margin-top:15px;'>"
						+"<p style='color:#3e2b2c;font-size:11px; height:100px; line-height:33px;'>본 메일은 발신전용 메일입니다."
						+"궁금하신 점은 <a style='text-decoration:none; color:#555' target='_blank' href='http://www.shillahotels.com/membership/inquires/contactus/memIndex.do?lang=ko'>Contact Us</a>로 문의해주시기 바랍니다.</p>"
						+"</div></div>"
						+"<div style='float:left; background-color:#3e2b2c;padding:10px 0;text-align:center;width:100%;'>"
						+"<p style='font-size:10px;color:#ab9899;'>Copyright © LOTTE CINEMA CO LTD. All Rights Reserved. 롯데시네마 : TEL +82-2-2230-5528</p>"
						+"</div></div></div>";
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
