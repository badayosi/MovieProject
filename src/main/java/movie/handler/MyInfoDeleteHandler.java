package movie.handler;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.service.UserService;
import mvc.controller.CommandHandler;

public class MyInfoDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("핸들러 시작");
		String userId = req.getParameter("userId");
		UserService service = UserService.getInstance();
		
		int result = service.deleteUpdate(userId);
		System.out.println("서비스 종료");
		req.getSession().removeAttribute("member");
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
