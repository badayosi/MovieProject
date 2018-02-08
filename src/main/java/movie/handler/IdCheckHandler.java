package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Address;
import movie.dto.User;
import movie.service.AddressService;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class IdCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		UserService service = UserService.getInstance();
		String id = req.getParameter("id");
		User user = service.selectById(id);
		ObjectMapper om = new ObjectMapper();
		String check = "true";
		if(user != null){
			check = "false";
		}
		
		String json = om.writeValueAsString(check); //json 형태의 String으로 변환
		
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
