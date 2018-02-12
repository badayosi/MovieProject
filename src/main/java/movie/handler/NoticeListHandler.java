package movie.handler;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Notice;
import movie.service.NoticeService;
import mvc.controller.CommandHandler;

public class NoticeListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		NoticeService service = NoticeService.getInstance();
		int size = service.selectTosize();
		List<Notice> list = service.selectByAll(0);
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("size",size);
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(map);
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);			
		pw.flush();
		return null;
	}

}
