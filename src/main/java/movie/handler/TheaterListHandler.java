package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Theater;
import movie.service.TheaterService;
import mvc.controller.CommandHandler;

public class TheaterListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		TheaterService service = TheaterService.getInstance();
		List<Theater> list = service.selectAll();
		
		/*if(list.size()>0){
			for(Theater t :list){
				System.out.println(t.toString());
				System.out.println(t.getTheaterName());
			}
		}*/
		req.setAttribute("list", list);
		
		return "managerMain.jsp";
	}

}
