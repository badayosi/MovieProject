package movie.handler;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie.dto.Movie;
import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class ManagerAddMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "managerAddMovieForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			MovieService service=MovieService.getInstance();
			int lastNo=service.selectLastNo();
			
			// 서버안에 upload라는 폴더의 실제 경로를 받아온다.
			String uploadPath = req.getRealPath("upload/"+(lastNo+1));

			File dir = new File(uploadPath);
			if (dir.exists() == false) {
				dir.mkdirs();// 폴더 만들기
			}
			System.out.println("uploadPath : " + uploadPath);

			int maxSize = 1024 * 1024 * 10;// 10M

			try {
				// 업로로드 완료
				MultipartRequest multi = new MultipartRequest(req, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
				
				String name = multi.getParameter("movieName");
				String director = multi.getParameter("movieDirector");
				String actor = multi.getParameter("movieActor");
				String genre = multi.getParameter("movieGenre");
				int rating = Integer.parseInt(multi.getParameter("movieRating"));
				int playTime = Integer.parseInt(multi.getParameter("moviePlaytime"));
				String synopsis = multi.getParameter("movieSynopsis");
				Date openDate = new SimpleDateFormat("yyyy-MM-dd").parse(multi.getParameter("movieOpenDate"));
				Date closeDate = new SimpleDateFormat("yyyy-MM-dd").parse(multi.getParameter("movieOpenDate"));
				String poster = multi.getFilesystemName("moviePoster");
				String steelCut=multi.getParameter("movieSteelCut");
				String video = multi.getFilesystemName("movieVideo");
				String filePath=uploadPath;

				Movie movie = new Movie(0, name, poster, playTime, rating, 0, openDate, closeDate, genre,
						steelCut, video, synopsis, actor, director,filePath);

				service.insert(movie);

				res.sendRedirect("managerListMovie.do");

				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "managerListMovie.do";
		}
		return null;
	}

}
