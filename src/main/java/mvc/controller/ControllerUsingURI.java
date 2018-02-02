package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerUsingURI extends HttpServlet {
	private HashMap<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);
		
		try(FileReader fis = new FileReader(configFilePath)){
			prop.load(fis);
		}catch(Exception e){
			throw new ServletException();
		}
		
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()){
			// KEY
			String command = (String)keyIter.next();
			// VALUE
			String handlerClassName = prop.getProperty(command);
			try{
				// 문자열에 해당하는 부분을 CLASS화
				Class<?> handlerClass = Class.forName(handlerClassName);
				// NEW 후 Instance화 과정을 진행
				CommandHandler handlerInstance = (CommandHandler)handlerClass.newInstance();
				commandHandlerMap.put(command, handlerInstance);
			}catch(Exception e){
				throw new ServletException();
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// COMMAND 추출 단계
		String command = request.getRequestURI();
		String contextPath = request.getContextPath();
		if(command.indexOf(contextPath) == 0){
			command = command.substring(contextPath.length());
		}
		
		CommandHandler handler = commandHandlerMap.get(command);
		// COMMAND를 제대로 가져오지 못하였을때 예외처리
		if(handler == null){
			handler = new NullHandler();
		}
		
		// COMMAND를 정상적으로 가져왔을때
		String viewPage = null;
		try{
			viewPage = handler.process(request, response);
		}catch(Exception e){
			e.printStackTrace();
			throw new ServletException();
		}
		
		if(viewPage != null){
			RequestDispatcher dis = request.getRequestDispatcher(viewPage);
			dis.forward(request, response);
		}
	}
}
