package movie.handler;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.User;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class MyInfoUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String tel = req.getParameter("tel");
		String addr = req.getParameter("addr");
		String email = req.getParameter("email");
		String userId = req.getParameter("userId");
		
		User user = new User();
		user.setAddr(addr);
		user.setPhone(tel);
		user.setUserId(userId);
		user.setEmail(email);
		System.out.println(user);
		UserService service =UserService.getInstance();
		int result = service.userUpdate(user);
		HashMap<String,Integer> map = new HashMap<>();
		map.put("result", result);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(map); //json 형태의 String으로 변환
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
