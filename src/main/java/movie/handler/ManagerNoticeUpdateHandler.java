package movie.handler;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Notice;
import movie.service.NoticeService;
import mvc.controller.CommandHandler;

public class ManagerNoticeUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			int no = Integer.parseInt(req.getParameter("no"));
			NoticeService service =NoticeService.getInstance();
			Notice notice = service.selectByNoOne(no);
			req.setAttribute("notice", notice);
			return "ManagerUpdateBoard.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			int boardNo = Integer.parseInt(req.getParameter("no"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			Date regdate = new Date();
			Notice notice = new Notice();
			notice.setBoardNo(boardNo);
			notice.setContent(content);
			notice.setTitle(title);
			notice.setRegdate(regdate);
			
			NoticeService service =NoticeService.getInstance();
			service.updateNotice(notice);
			req.setAttribute("updateNo", boardNo);
			return "ServiceUserBoard.jsp";
		}
		return null;
	}

}
