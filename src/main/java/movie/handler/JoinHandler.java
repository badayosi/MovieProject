package movie.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dto.User;
import movie.service.UserService;
import mvc.controller.CommandHandler;

public class JoinHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			System.out.println("getJoin");
			return "login/JoinForm.jsp";
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
			String address = "("+zipcode+")"+addr;
			String gender = req.getParameter("gender");
			String userRank = "일반등급";
			int point = 0;
			User user = new User(id, pw, point, email, phone, address, gender, userRank, name);
			System.out.println(user);
			UserService service = UserService.getInstance();
			int result = service.insertUser(user);
			
			if(result < 0){
				req.setAttribute("error","회원가입에 실패하였습니다.");
				return "login/JoinForm.jsp";
			}else{
				req.setAttribute("success","회원가입에 성공하였습니다.");
				req.setAttribute("name",name);
				return "login/JoinForm.jsp";
			}
		}
		return null;
	}

}
