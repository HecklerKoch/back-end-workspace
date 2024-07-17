package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import config.Serverinfo;

public class DBConnectionTest3 {
	
	public static void main(String[] args) {
		
		try {
			// 1. 드라이버 로딩
			Class.forName(Serverinfo.DRIVER_NAME);
			
			// 2. 디비 연결
			Connection conn = DriverManager.getConnection(Serverinfo.URL ,Serverinfo.USER ,Serverinfo.PASSWORD);
			
			// 3. PreparedStatement - 쿼리 : UPDATE (emp_id 선택해서 emp_name 변경)
			String queary = "UPDATE employee SET emp_name = ? WHERE emp_id = ?";
			
			PreparedStatement ps = conn.prepareStatement(queary);
			
			ps.setString(1, "김일성");
			ps.setInt(2, 600);
			
			// 4. 쿼리문 실행
			System.out.println(ps.executeUpdate()+ "명 수정");
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	
	}

}
