package movie.handler;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import movie.dto.Movie;
import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class ManagerReadMovieHandler implements CommandHandler {

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

			return "managerReadMovieForm.jsp";
		}
		return null;
	}

}
