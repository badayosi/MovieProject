package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.ServiceBoard;
import movie.service.ServiceBoardService;
import mvc.controller.CommandHandler;

public class ManagerServiceBoardUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ServiceBoardService service = ServiceBoardService.getInstance();
		int boardNo = Integer.parseInt(req.getParameter("no"));
		ServiceBoard sb = service.selectByNo(boardNo);
		
		req.setAttribute("sb", sb);
		return "ManagerBoardAnswer.jsp";
	}

}
