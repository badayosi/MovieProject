package movie.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.ServiceBoard;
import movie.service.ServiceBoardService;
import mvc.controller.CommandHandler;

public class ManagerServiceBoardAnswerListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String b = req.getParameter("b");
		
		if(b.equals("true")){
			ServiceBoardService service = ServiceBoardService.getInstance();
			List<ServiceBoard> lists = service.selectByanswer(true);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(lists); //json 형태의 String으로 변환
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.print(json);
			pw.flush();
			return null;
		}else{
			ServiceBoardService service = ServiceBoardService.getInstance();
			List<ServiceBoard> lists = service.selectByanswer(false);

			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(lists); //json 형태의 String으로 변환
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.print(json);
			pw.flush();
			return null;
		}
		
	}

}
