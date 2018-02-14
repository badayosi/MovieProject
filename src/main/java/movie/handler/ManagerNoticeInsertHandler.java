package movie.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Notice;
import movie.service.NoticeService;
import mvc.controller.CommandHandler;
import sun.print.resources.serviceui;

public class ManagerNoticeInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		Date regdate = new Date();
		int readcount = 0;
		Notice notice = new Notice(title, content, regdate, readcount);
		NoticeService service = NoticeService.getInstance();
		
		int result = service.insert(notice);
		if(result <0){
			req.setAttribute("error","insert error");
			return "ManagerServiceBoard.jsp";
		}else{
			req.setAttribute("success","insert success");
			req.setAttribute("notice", notice);
			return "ManagerServiceBoard.jsp";
		}
	}

}
