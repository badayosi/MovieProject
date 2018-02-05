package jdbc.setting;

import java.sql.Connection;

public class ControlMain {
	public static void main(String[] args) {
		DBCon dbCon = DBCon.getInstance();
		Connection connection = dbCon.getConnection();
		System.out.println(connection);
		
		DbService service = InitService.getInstance();
		service.service();
		System.out.println("초기화 끝");
		service = ImportService.getInstance();
		service.service();
		service = ExportService.getInstance();
		service.service();
		
		jdbcUtil.close(connection);
	}
}
