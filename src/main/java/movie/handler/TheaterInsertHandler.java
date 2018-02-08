package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Theater;
import movie.service.TheaterService;
import mvc.controller.CommandHandler;

public class TheaterInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			
			return "managerInsert.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			req.setCharacterEncoding("utf-8");
			Theater theater = new Theater(req.getParameter("name"), 
										Integer.parseInt(req.getParameter("floor")),
										Integer.parseInt(req.getParameter("maxcount")), 
										req.getParameter("row"), 
										Integer.parseInt(req.getParameter("col")), 
										req.getParameter("type"));
			
			//System.out.println(theater.toString());
			TheaterService service = TheaterService.getInstance();
			int result = service.insertTheater(theater);
			
			if(result<0){
				req.setAttribute("result", "에러");
			}
			if(result>0){
				req.setAttribute("result", "성공");
			}
			res.sendRedirect("list.do");
			return null;
		}
		return null;
	}
}
