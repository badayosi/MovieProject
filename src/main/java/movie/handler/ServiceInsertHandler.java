package movie.handler;

import java.io.File;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie.dto.ServiceBoard;
import movie.service.ServiceBoardService;
import mvc.controller.CommandHandler;

public class ServiceInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {	
		String uploadPath = req.getRealPath("upload");
		
		File dir = new File(uploadPath);
		if(dir.exists()==false){
			dir.mkdirs();//폴더 만들기
		}
		System.out.println("uploadPath - " + uploadPath);
		
		int maxSize = 1024 * 1024 * 10;	//10M
		String filename = "";
		String originFileName = "";
		
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadPath,maxSize, "utf-8", new DefaultFileRenamePolicy());  
			
			//업로드된 파일명, 오리지날 명
			filename = multi.getFilesystemName("fileName");	//실제 업로드된 파일명(중복된 경우 바뀔수도있음)
			System.out.println(filename);
			if(filename == null){
				System.out.println("null일떄");
				String userId = multi.getParameter("userId");
				String consulting = multi.getParameter("consulting");
				String classification = multi.getParameter("classification");
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");
				Date regdate = new Date();
				boolean answer = false;
				ServiceBoardService service = ServiceBoardService.getInstance();
				
				ServiceBoard sb = new ServiceBoard(userId, consulting, classification, title, content, regdate,answer);		
				int result = service.insert(sb);	
				req.setAttribute("insertService", "성공");
				
				return "ServiceUserBoard.jsp";
			}else{
				System.out.println("파일잇음");
				String filePath = req.getContextPath() + "/upload";
				originFileName = multi.getOriginalFileName("file1"); //원래 파일명
				String userId = multi.getParameter("userId");
				String consulting = multi.getParameter("consulting");
				String classification = multi.getParameter("classification");
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");
				Date regdate = new Date();
				boolean answer = false;
				
				ServiceBoardService service = ServiceBoardService.getInstance();
				
				ServiceBoard sb = new ServiceBoard(userId, consulting, classification, title, content, regdate,answer,filename,filePath);		
				System.out.println(sb);
				int result = service.insertFile(sb);
				req.setAttribute("insertService", "성공");
				return "ServiceUserBoard.jsp";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		
		return null;
		
	}

}
