package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.ServiceBoard;
import movie.service.ServiceBoardService;
import mvc.controller.CommandHandler;

public class MynoticeSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String select = req.getParameter("select");
		String text = "%"+req.getParameter("text")+"%";
		
		if(select.equals("아이디")){
			ServiceBoardService service = ServiceBoardService.getInstance();
			List<ServiceBoard> lists = service.selectByUserserachlist(text);
			ObjectMapper om = new ObjectMapper();
			
			String json = om.writeValueAsString(lists); //json 형태의 String으로 변환
			
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.print(json);
			pw.flush();
		}else if(select.equals("제목")){
			ServiceBoardService service = ServiceBoardService.getInstance();
			List<ServiceBoard> lists = service.selectByuserIdTitle(text);
			ObjectMapper om = new ObjectMapper();
			
			String json = om.writeValueAsString(lists); //json 형태의 String으로 변환
			
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.print(json);
			pw.flush();
		}
		return null;
	}

}
