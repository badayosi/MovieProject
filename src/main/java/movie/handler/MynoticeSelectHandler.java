package movie.handler;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.ServiceBoard;
import movie.service.ServiceBoardService;
import mvc.controller.CommandHandler;

public class MynoticeSelectHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("no"));
		ServiceBoardService service = ServiceBoardService.getInstance();
		ServiceBoard sb = service.selectByNo(boardNo);
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(sb); //json 형태의 String으로 변환
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;   
	}

}
