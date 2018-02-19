package movie.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

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
			Date odate=movie.getOpenDate();
			Date cdate=movie.getCloseDate();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
			String openDate=sdf.format(odate);
			String closeDate=sdf.format(cdate);
			
			String steelcut=movie.getPathSteelcut().trim();
			String[] arrSteelcut=steelcut.split(",");
			
			req.setAttribute("movie", movie);
			req.setAttribute("steelcut", arrSteelcut);
			req.setAttribute("openDate", openDate);
			req.setAttribute("closeDate", closeDate);
			return "userReadMovie.jsp";
		}
		return null;
	}

}
