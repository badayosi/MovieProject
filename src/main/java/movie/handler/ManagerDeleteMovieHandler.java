package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class ManagerDeleteMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int mNo=Integer.parseInt(req.getParameter("no"));
		MovieService service=MovieService.getInstance();
		service.delete(mNo);
		return "managerListMovie.do";
	}

}
