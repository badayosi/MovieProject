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

public class ManagerUpdateMovieHandler implements CommandHandler {

	MovieService service = MovieService.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {		
			Movie movie = service.selectById(Integer.parseInt(req.getParameter("no")));

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String openDate = sdf.format(movie.getOpenDate());
			String closeDate = sdf.format(movie.getCloseDate());

			req.setAttribute("movie", movie);
			req.setAttribute("openDate", openDate);
			req.setAttribute("closeDate", closeDate);

			return "managerUpdateMovieForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			System.out.println("업데이트 핸들러 진입");
			try {
				int maxSize = 1024 * 1024 * 10;// 10M
				int mNo=Integer.parseInt(req.getParameter("mNo"));
				String uploadPath= service.selectFilePath(mNo);
				String delState=req.getParameter("yes");
				if(delState=="1"){
					File files[]=new File(uploadPath).listFiles();
					for(int i=0;i<files.length;i++){
						files[i].delete();
					}
					System.out.println("폴더 하위파일 삭제 완료");
				}
				
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
				
				Movie movie;
				
				if(poster==null && steelCut==null && video==null){	
					movie=new  Movie(mNo, name, playTime, rating, openDate, closeDate, genre, synopsis, actor, director);
					service.updateWithOutFile(movie);
					System.out.println("새로운 파일이 없어 파일 빼고 업데이트 완료 하였습니다.");
				}else{
					movie=new Movie(mNo, name, poster, playTime, rating, openDate, closeDate, genre, steelCut, video, synopsis, actor, director, uploadPath);
					service.updateWithFile(movie);
					System.out.println("새로운 파일이 있으므로 파일도 함께 업데이트 완료하였습니다.");
				}
				
				return "managerReadMovie.do?no="+mNo;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}

}
