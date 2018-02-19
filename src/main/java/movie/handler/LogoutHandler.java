package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.CommandHandler;

public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {	
		req.getSession().removeAttribute("member");
		res.sendRedirect("/MovieProject/index.jsp");
		return null;
	}
}