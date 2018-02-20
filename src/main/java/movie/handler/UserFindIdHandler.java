package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.User;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class UserFindIdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		
		UserService service = UserService.getInstance();
		User findUser = service.findId(user);
		
		req.setAttribute("id", findUser.getUserId());
		
		return "findIdPw.jsp";
	}

}
