package movie.handler;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Board;
import movie.service.BoardService;
import mvc.controller.CommandHandler;

public class StarBoardHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		BoardService service = BoardService.getInstance();
		int size = service.selectTosize() /4;
		HashMap<String,Object> map = new HashMap<>();
		
		map.put("size",size);
		if(req.getParameter("size").equalsIgnoreCase("0")){
			
			int boardsize = 0;
			List<Board> list = service.selectLimit(boardsize);
			map.put("list", list);
			ObjectMapper om = new ObjectMapper();
			//String json = om.writeValueAsString(list); //json 형태의 String으로 변환
			String json = om.writeValueAsString(map);
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.print(json);			
			pw.flush();
			
		
		}else if(!req.getParameter("size").equalsIgnoreCase("0")){
			
			int boardsize = Integer.parseInt(req.getParameter("size"))*4;
			System.out.println(boardsize);
			List<Board> list = service.selectLimit(boardsize);
			ObjectMapper om = new ObjectMapper();
			map.put("list", list);
			String json = om.writeValueAsString(map); //json 형태의 String으로 변환
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.print(json);
			pw.flush();
		}
		return null;
	}

}
