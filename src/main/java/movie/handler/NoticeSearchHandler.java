package movie.handler;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import movie.dto.Notice;
import movie.service.NoticeService;
import mvc.controller.CommandHandler;

public class NoticeSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String selectText = req.getParameter("selectText");
		String searchText = "%"+req.getParameter("searchText")+"%";
		NoticeService service = NoticeService.getInstance();
		HashMap<String,Object> map = new HashMap<>();
		int size = 0;
		Notice notice = new Notice();
		List<Notice> list = null;
		if(req.getParameter("no").equals("0")){
			switch(selectText){
			case "제목" :
				notice.setTitle(searchText);
				size = (service.selectTosizeTitle(searchText)/10);
				if(service.selectTosizeTitle(searchText) %10 != 0){
					size +=1;
				}
				list = service.selectByTitle(notice);
				break;
			case "내용" :
				notice.setContent(searchText);
				list = service.selectByContent(notice);
				size = (service.selectTosizeContent(searchText) /10);
				if(service.selectTosizeContent(searchText) %10 != 0){
					size +=1;
				}
				break;
			case "제목+내용" :
				notice.setContent(searchText);
				notice.setTitle(searchText);
				list = service.selectByContentTitle(notice);
				size = (service.selectTosizeTitleContent(searchText)) /10;
				if(service.selectTosizeTitleContent(searchText) %10 != 0){
					size +=1;
				}
				break;
			}
		}else{
			int boardNo = Integer.parseInt(req.getParameter("no")) * 10;
			System.out.println(boardNo);
			notice.setBoardNo(boardNo);
			switch(selectText){
			case "제목" :
				notice.setTitle(searchText);
				size = (service.selectTosizeTitle(searchText)/10);
				if(service.selectTosizeTitle(searchText) %10 != 0){
					size +=1;
				}
				list = service.selectByTitle(notice);
				break;
			case "내용" :
				notice.setContent(searchText);
				list = service.selectByContent(notice);
				size = (service.selectTosizeContent(searchText) /10);
				if(service.selectTosizeContent(searchText) %10 != 0){
					size +=1;
				}
				break;
			case "제목+내용" :
				notice.setContent(searchText);
				notice.setTitle(searchText);
				list = service.selectByContentTitle(notice);
				size = (service.selectTosizeTitleContent(searchText)) /10;
				if(service.selectTosizeTitleContent(searchText) %10 != 0){
					size +=1;
				}
				break;
			}
		}
		
		map.put("list", list);
		map.put("size", size);
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(map);
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print(json);
		pw.flush();
		return null;
	}

}
