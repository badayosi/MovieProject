package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.User;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class UserMainListMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		UserService service  = UserService.getInstance();
		List<User> list = service.selectAll();

		if(list.size()>0){
			for(User t :list){
				System.out.println(t.toString());
			}
		}
		
		req.setAttribute("list", list);
		
		return "userList.jsp";
	}

}
