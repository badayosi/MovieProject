package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.MyMovieHistory;
import movie.service.MyMovieHistoryService;
import mvc.controller.CommandHandler;

public class MyMovieHistoryHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String userId = req.getParameter("userId");
		MyMovieHistoryService service = MyMovieHistoryService.getInstance();
		List<MyMovieHistory> lists = service.selectById(userId);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(lists); //json 형태의 String으로 변환
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
