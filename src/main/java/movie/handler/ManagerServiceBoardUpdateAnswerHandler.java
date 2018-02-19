package movie.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.ServiceBoard;
import movie.service.ServiceBoardService;
import mvc.controller.CommandHandler;

public class ManagerServiceBoardUpdateAnswerHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("no"));
		String answerContent = req.getParameter("answerContent");
		System.out.println(answerContent);
		boolean answer = true;
		Date regdate = new Date();
		ServiceBoard sb = new ServiceBoard(boardNo, regdate, answer, answerContent);
		ServiceBoardService service = ServiceBoardService.getInstance();
		service.update(sb);
		return "ManagerBoard.jsp";
	}

}
