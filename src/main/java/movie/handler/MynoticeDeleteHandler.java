package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.ServiceBoardService;
import mvc.controller.CommandHandler;

public class MynoticeDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("no"));
		ServiceBoardService service = ServiceBoardService.getInstance();
		service.delete(boardNo);
		
		return null;
	}

}
