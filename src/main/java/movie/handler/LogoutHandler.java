package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.CommandHandler;

public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String path = req.getParameter("path");
		String path2 = path.substring(path.lastIndexOf("/")+1, path.length());
		
		req.getSession().removeAttribute("member");
		return path2;
	}

}
