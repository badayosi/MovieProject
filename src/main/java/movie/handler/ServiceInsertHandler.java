package movie.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.ServiceBoard;
import movie.service.ServiceBoardService;
import mvc.controller.CommandHandler;

public class ServiceInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ServiceBoardService service = ServiceBoardService.getInstance();
		String userId = req.getParameter("userId");
		String consulting = req.getParameter("consulting");
		String classification = req.getParameter("classification");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		Date regdate = new Date();
		boolean answer = false;
		ServiceBoard sb = new ServiceBoard(userId, consulting, classification, title, content, regdate,answer);
		
		int result = service.insert(sb);
		
		return null;
	}

}
