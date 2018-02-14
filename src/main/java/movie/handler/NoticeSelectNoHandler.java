package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Notice;
import movie.service.NoticeService;
import mvc.controller.CommandHandler;

public class NoticeSelectNoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int no = Integer.parseInt(req.getParameter("no")) -1;
		NoticeService service = NoticeService.getInstance();
		List<Notice> list = service.selectByNo(no);
		Notice notice = list.get(1);
		notice.setReadcount(notice.getReadcount()+1);
		service.update(notice);
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(list);
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;

	}

}
