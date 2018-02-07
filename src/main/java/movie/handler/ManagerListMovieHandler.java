package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Movie;
import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class ManagerListMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("listMovieHandler");
		if(req.getMethod().equalsIgnoreCase("get")){
			MovieService service=MovieService.getInstance();
			List<Movie> list=service.selectAll();
			req.setAttribute("movieList", list);
			
			return "/manager/managerListMovieForm.jsp";
		}
		return null;
	}

}
