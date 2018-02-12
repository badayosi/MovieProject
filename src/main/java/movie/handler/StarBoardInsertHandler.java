package movie.handler;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Board;
import movie.service.BoardService;
import mvc.controller.CommandHandler;

public class StarBoardInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		BoardService service = BoardService.getInstance();
		String userId = req.getParameter("userId");
		int movie_no = Integer.parseInt(req.getParameter("movie_no"));
		String board_content = req.getParameter("board_content");
		String userName = req.getParameter("userName");
		int grade = Integer.parseInt(req.getParameter("grade"));
		Date regdate = new Date();
		Board board = new Board(userId, movie_no, board_content, regdate, grade, userName);
		int result = service.insertBoard(board);
		
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(result); //json 형태의 String으로 변환
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}
}
