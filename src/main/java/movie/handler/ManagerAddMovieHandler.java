package movie.handler;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie.dto.Movie;
import movie.service.MovieService;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ManagerAddMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "managerAddMovieForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			System.out.println("addMovie 진행중");

			// 서버안에 upload라는 폴더의 실제 경로를 받아온다.
			String uploadPath = req.getRealPath("upload/m1");

			File dir = new File(uploadPath);
			if (dir.exists() == false) {
				dir.mkdirs();// 폴더 만들기
			}
			System.out.println("uploadPath : " + uploadPath);

			int maxSize = 1024 * 1024 * 10;// 10M

			try {
				// 업로로드 완료
				MultipartRequest multi = new MultipartRequest(req, uploadPath, maxSize, "utf-8",
						new DefaultFileRenamePolicy());

				HashMap<String, String> map = new HashMap<>();
				String poster = "";
				String originPoster = "";
				// String[] steelCut=multi.getParameterValues("movieSteelCut");

				ArrayList<String> arrSteelCut = new ArrayList<String>();
				ArrayList<String> arrOriginSteelCut = new ArrayList<String>();

				Enumeration<String> e = multi.getFileNames(); 
				System.out.println("이너머레이션"+multi.getFileNames().toString());
				
				for (int i = 0; i < 5; i++) {

					if (e.hasMoreElements()) {

						String name = (String) e.nextElement();
						arrSteelCut.add(multi.getFilesystemName(name));
						arrOriginSteelCut.add(multi.getOriginalFileName(name));

					}
				}

				
				System.out.println("어레이리스트 사이즈: " + arrSteelCut.size());
				for (int i = 0; i < arrSteelCut.size(); i++) {

					System.out.println(arrSteelCut.get(i));
					System.out.println(arrOriginSteelCut.get(i));
					System.out.println("");
				}

				String video = "";
				String originVideo = "";

				// 업로드된 파일명, 오리지날 명
				/*
				 * poster = multi.getFilesystemName("moviePoster");// 실제 업로드된
				 * 파일명 originPoster =
				 * multi.getOriginalFileName("moviePoster");// 원래 파일명
				 * map.put("poster", poster); map.put("originPoster",
				 * originPoster);
				 * 
				 * for(int i=0;i<steelCut.length;i++){
				 * arrSteelCut.add(steelCut[i]);
				 * arrOriginSteelCut.add(steelCut[i]);
				 * map.put("steelCut"+(i+1),arrSteelCut.get(i));
				 * map.put("originSteelCut"+(i+1),arrOriginSteelCut.get(i)); }
				 * video = multi.getFilesystemName("movieVideo"); originVideo =
				 * multi.getOriginalFileName("movieVideo"); map.put("video",
				 * video); map.put("originVideo", originVideo);
				 * 
				 * req.setAttribute("file", map);
				 * 
				 * String name1 = multi.getParameter("movieName"); String
				 * director1 = multi.getParameter("movieDirector"); String
				 * actor1 = multi.getParameter("movieActor"); String genre1 =
				 * multi.getParameter("movieGenre");
				 * 
				 * int rating1 =
				 * Integer.parseInt(multi.getParameter("movieRating"));
				 * 
				 * int playTime1 =
				 * Integer.parseInt(multi.getParameter("moviePlaytime")); String
				 * synopsis1 = multi.getParameter("movieSynopsis"); Date
				 * openDate1 = new
				 * SimpleDateFormat("yyyy-MM-dd").parse(multi.getParameter(
				 * "movieOpenDate")); Date closeDate1 = new
				 * SimpleDateFormat("yyyy-MM-dd").parse(multi.getParameter(
				 * "movieOpenDate")); String poster1 =
				 * multi.getParameter("moviePoster"); String video1=
				 * multi.getParameter("movieVideo"); String[] steelImg1 =
				 * multi.getParameterValues("movieSteelCut"); String steelCut1 =
				 * "";
				 * 
				 * for (int i = 0; i < steelImg1.length; i++) { steelCut1 +=
				 * steelImg1[i] + ","; }
				 * 
				 * Movie movie = new Movie(0, name1, poster, playTime1, rating1,
				 * 0, openDate1, closeDate1, genre1, steelCut1, video1,
				 * synopsis1, actor1, director1);
				 * 
				 * 
				 * MovieService service = MovieService.getInstance();
				 * service.insert(movie);
				 * 
				 * 
				 * 
				 * res.sendRedirect("managerListMovie.do");
				 */
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "managerListMovie.do";
		}
		return null;
	}

}
