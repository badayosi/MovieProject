package movie.handler;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import mvc.controller.CommandHandler;

public class ChangeServiceviewHandler  implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageName = req.getParameter("pageName");
		HashMap<String,String> map = new HashMap<>();
		if(pageName.equals("공지사항")){
			
			map.put("page","ServiceUserBoardSuccess.jsp");
		}else{
			map.put("page","ServiceUserBoardView.jsp");
		}
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(map); //json 형태의 String으로 변환
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
