package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Movie;
import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class MovieListHandler implements CommandHandler {
	//유저화면에서 현재 상영작, 상영 예정작을 나타내기 위한 handler입니다.
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MovieService service=MovieService.getInstance();
		List<Movie> mList= service.selectAll();
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(mList); //json 형태의 String으로 변환
		
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
