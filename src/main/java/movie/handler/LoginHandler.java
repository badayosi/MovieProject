package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.User;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("get")){
		
			return "Login.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			UserService service = UserService.getInstance();
			User u = new User(id,password);
			User user = service.selectById(id);
			User user1 = service.selectByIdCheckpass(u);
			
			if(user == null){
				req.setAttribute("error","등록된 아이디가 없습니다.");
				return "Login.jsp";
			}else if(user1 == null){
				req.setAttribute("error","비밀번호가 일치하지 않습니다.");
				return "Login.jsp";
			}else if(user.getUserRank().equals("탈퇴회원")){
				req.setAttribute("error","탈퇴한 회원입니다.");
				return "Login.jsp";
			}			
			System.out.println(user);
			req.getSession().setAttribute("member",user);
			
			res.sendRedirect("/MovieProject/index.jsp");
			return null;
			
		}
		return null;
	}

}
