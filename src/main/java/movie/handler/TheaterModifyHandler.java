package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.Theater;
import movie.service.TheaterService;
import mvc.controller.CommandHandler;

public class TheaterModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String no1 = req.getParameter("no");
			int no =Integer.parseInt(no1);
			TheaterService service = TheaterService.getInstance();
			Theater theater =  service.selectById(no);
			//System.out.println(theater);
			req.setAttribute("item", theater);
			
			return "managerModify.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")){
			req.setCharacterEncoding("utf-8");
			String no1 = req.getParameter("number");
			int no =Integer.parseInt(no1);
			
			Theater theater = new Theater(no,req.getParameter("name"), 
							Integer.parseInt(req.getParameter("floor")),
							Integer.parseInt(req.getParameter("maxcount")), 
							req.getParameter("row"), 
							Integer.parseInt(req.getParameter("col")), 
							req.getParameter("type"));
			theater.setTheaterTable(req.getParameter("table")); 
			//System.out.println(theater.toString());
			//System.out.println(no);
			TheaterService service = TheaterService.getInstance();
			int result = service.updateTheater(theater);
			int result1 = service.updateTheaterTable(theater);
			if(result<0){
				req.setAttribute("result", "에러");
			}
			if(result>0){
				req.setAttribute("result", "성공");
			}
			//System.out.println(result);
			res.sendRedirect("list.do");
			return null;
		}
		return null;
	}

}
