package movie.handler;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Movie;
import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class UserReadMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			MovieService service=MovieService.getInstance();
			
			int no=Integer.parseInt(req.getParameter("no"));			
			Movie movie=service.selectById(no);
			
			String steelcut=movie.getPathSteelcut().trim();
			String[] arrSteelcut=steelcut.split(",");

			req.setAttribute("movie", movie);
			req.setAttribute("steelcut", arrSteelcut);
			return "userReadMovie.jsp";
		}
		return null;
	}

}
