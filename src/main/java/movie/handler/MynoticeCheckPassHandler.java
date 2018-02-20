package movie.handler;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.User;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class MynoticeCheckPassHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String password = req.getParameter("password");
		String userId = req.getParameter("userId");
		UserService service = UserService.getInstance();
		User user = new User();
		user.setPassword(password);
		user.setUserId(userId);
		user = service.selectByIdCheckpass(user);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(user); //json 형태의 String으로 변환
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
