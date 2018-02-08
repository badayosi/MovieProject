package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.TheaterService;
import mvc.controller.CommandHandler;

public class TheaterDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String no1 = req.getParameter("no");
		int no =Integer.parseInt(no1);
		TheaterService service = TheaterService.getInstance();
		
		int result = service.deleteTheater(no);
		
		if(result<0){
			req.setAttribute("result", "에러");
		}
		if(result>0){
			req.setAttribute("result", "성공");
		}
		
		return "list.do";
	}

}
