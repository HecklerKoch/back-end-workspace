package jdbc;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import config.Serverinfo;

public class DBConnectionTest4 {

	public static void main(String[] args) {
		
		try {
			
			Properties p = new Properties();
			p.load(new FileInputStream("src/config/jdbc.properties"));
			
			// 1. 드라이버 로딩
			Class.forName(Serverinfo.DRIVER_NAME);
			// 2.디비 연결
			Connection conn = DriverManager.getConnection(Serverinfo.URL ,Serverinfo.USER ,Serverinfo.PASSWORD);
			// 3. PreparedStatement 문
			String delete = p.getProperty("delete");
			
			PreparedStatement ps = conn.prepareStatement(delete);
			
			ps.setInt(1, 600);
			// 4. 쿼리문 실행
			System.out.println(ps.executeUpdate()+"명 삭제");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
