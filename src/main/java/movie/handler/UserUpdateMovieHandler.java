package movie.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.User;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class UserUpdateMovieHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String no = req.getParameter("no");
			UserService service  = UserService.getInstance();
			User user = service.selectById(no);
			System.out.println(user.toString());
			req.setAttribute("item", user);
			
			return "userUpdate.jsp";
	
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String tel1 = req.getParameter("tel1");
			String tel2 = req.getParameter("tel2");
			String tel3 = req.getParameter("tel3");
			String phone = tel1 + "-"+tel2+"-"+tel3;
			String addr = req.getParameter("addr");
			String zipcode = req.getParameter("zipcode");
			String addrUser = req.getParameter("addrUser");
			String address = "("+zipcode+")"+addr+" "+addrUser;
			String gender = req.getParameter("gender");
			String userRank = "일반등급";
			String p = req.getParameter("point");
			int point = Integer.parseInt(p);
			
			User user = new User(id, pw, point, email, phone+"", address, gender, userRank, name);
			System.out.println(user.toString());
			
			UserService service = UserService.getInstance();
			int result = service.updateUser(user);
			
			System.out.println(result);
			
			return "userUpdateList.jsp";
		}
		return null;
	}
}