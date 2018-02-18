package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.NoticeService;
import mvc.controller.CommandHandler;

public class ManagerNoticeDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("no"));
		NoticeService service = NoticeService.getInstance();
		service.deleteNotice(boardNo);
		return "ServiceUserBoard.jsp";
	}

}
