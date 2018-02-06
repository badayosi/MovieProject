package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.CommandHandler;

public class ManagerAddMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "managerAddMovieForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			return "";
		}
		return null;
	}

}
