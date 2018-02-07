package movie.handler;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Movie;
import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class ManagerUpdateMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
if(req.getMethod().equalsIgnoreCase("get")){
			
			MovieService service=MovieService.getInstance();
			Movie movie=service.selectById(Integer.parseInt(req.getParameter("no")));
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String openDate=sdf.format(movie.getOpenDate());
			String closeDate=sdf.format(movie.getCloseDate());
			
			req.setAttribute("movie", movie);
			req.setAttribute("openDate", openDate);
			req.setAttribute("closeDate", closeDate);

			return "managerUpdateMovieForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
			return "managerUpdateMovie.do";
		}
		return null;
	}

}
