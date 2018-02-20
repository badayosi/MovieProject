package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.service.MovieService;
import mvc.controller.CommandHandler;

public class ManagerDeleteMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int mNo=Integer.parseInt(req.getParameter("no"));
		MovieService service=MovieService.getInstance();
		int result = service.delete(mNo);
		System.out.println(result);
		if(result<0){
			req.setAttribute("result", "시간표에 사용되어서 삭제가 불가능합니다.");
			return "managerReadMovie.do?no="+mNo;
		}
		if(result>0){
			req.setAttribute("result", "삭제에 성공하셨습니다.");
		}
		
		
		return "managerListMovie.do";
	}

}
