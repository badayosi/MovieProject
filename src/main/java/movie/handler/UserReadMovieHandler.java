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
			int no=Integer.parseInt(req.getParameter("no"));
			MovieService service=MovieService.getInstance();
			Movie movie=service.selectById(no);
			String steelcut=movie.getPathSteelcut().trim();
			
			String[] arrSteelcut=steelcut.split(",");
			System.out.println("이미지 갯수="+arrSteelcut.length);
			req.setAttribute("movie", movie);
			
			return "userReadMovie.jsp";
		}
		return null;
	}

}
