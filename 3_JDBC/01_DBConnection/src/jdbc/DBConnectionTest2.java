package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import config.Serverinfo;

public class DBConnectionTest2 {
	
	public static void main(String[] args) {
		
		try {
			// 1. 드라이버 로딩
			Class.forName(Serverinfo.DRIVER_NAME);
			
			// 2. 데이터베이스 연결
			Connection conn = DriverManager.getConnection(Serverinfo.URL, Serverinfo.USER, Serverinfo.PASSWORD);
			
			// 3. PreparedStatement - INSERT
			
			String queary = "INSERT INTO employee(emp_id, emp_name, emp_no) VALUES (?, ?, ?)";
			
			PreparedStatement ps = conn.prepareStatement(queary);
			
			ps.setInt(1, 600);
			ps.setString(2, "홍길동");
			ps.setString(3, "111111-2222222");
			
			// 4. 쿼리문 실행
			System.out.println(ps.executeUpdate() + "명 추가");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
