package movie.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Movie;
import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class ManagerAddMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "managerAddMovieForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			System.out.println("addMovie 진행중");
			String name=req.getParameter("movieName");
			String director=req.getParameter("movieDirector");
			String actor=req.getParameter("movieActor");
			String genre=req.getParameter("movieGenre");
			int rating=Integer.parseInt(req.getParameter("movieRating"));
			int playTime=Integer.parseInt(req.getParameter("moviePlaytime"));
			String synopsis=req.getParameter("movieSynopsis");
			Date openDate=new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("movieOpenDate"));
			Date closeDate=new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("movieOpenDate"));
			String poster=req.getParameter("moviePoster");
			String video=req.getParameter("movieVideo");
			String[] steelImg=req.getParameterValues("movieSteelCut");
			String steelCut="";
			
			for(int i=0;i<steelImg.length;i++){
				steelCut+=steelImg[i]+",";
			}
			
			Movie movie=new Movie(0, name, poster, playTime, rating, 0, openDate, closeDate, genre, steelCut, video, synopsis, actor, director);
			
			MovieService service=MovieService.getInstance();
			service.insert(movie);
			
			res.sendRedirect("managerListMovie.do");
			return null;
		}
		return null;
	}

}
