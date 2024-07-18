package com.kh.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.model.Member;

import config.Serverinfo;

public class MemberController {
	Properties p = new Properties();
	
	//싱글톤 패턴(singleton Pattern)
	// - 디자인 패턴 중 하나로 클래스가 최대 한 번만 객체 생성되도록 하는 패턴
	
	// 1. 생성자는 private
	private MemberController() {
		try {
			p.load(new FileInputStream("src/config/jdbc.properties"));
			
			
			Class.forName(Serverinfo.DRIVER_NAME);
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}
	private static MemberController instance;
	
	public Connection connect() throws SQLException {
		return DriverManager.getConnection(Serverinfo.URL, Serverinfo.USER, Serverinfo.PASSWORD);
	}
	
	public void close(PreparedStatement ps, Connection conn) throws SQLException {
		ps.close();
		conn.close();
	}
	
	public  boolean idCheck (String id) throws SQLException {
		Connection conn = connect();
		PreparedStatement ps = conn.prepareStatement(p.getProperty("idCheck"));
		ps.setString(1, id);
		
		ResultSet rs = ps.executeQuery();
		String checkId = null;
		
		if(rs.next()) checkId = rs.getString("id");
		close(rs, ps, conn);
		return true;
	}
		
	public String signUp(Member m) {

		// 회원가입 기능 구현! 
		// -> 아이디가 기존에 있는지 체크 여부!
		// -> member 테이블에 데이터 추가! 
		try {
		Connection conn = connect();
		PreparedStatement ps = conn.prepareStatement(p.getProperty("signUp"));
		ps.setString(1, m.getId());
		ps.setString(2, m.getPassword());
		ps.setString(3, m.getName());
		
		ps.executeUpdate();
		close(ps, conn);
		return true;
		
		} catch (SQLException e) {
			return false;
		}
		
	}
	
	public String login(String id, String password) throws SQLException {

		// 로그인 기능 구현! 
		// -> member 테이블에서 id와 password로 멤버 정보 하나 가져오기!
		Connection conn = connect();
		PreparedStatement ps = conn.prepareStatement(p.getProperty("login"));
		ps.setString(1, id);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		String name = null;
		
		if(rs.next()) name = rs.getString("name");
		close(rs, ps, conn);
		
		return name;
	}
	
	public void changePassword(String id, String oldPw, String newPw) {

		// 비밀번호 바꾸기 기능 구현!
		// -> login 메서드 활용 후 사용자 이름이 null이 아니면 member 테이블에서 id로 새로운 패스워드로 변경
		
	}
	
	public void changeName(String id, String newName) throws SQLException {

		// 이름 바꾸기 기능 구현!
		// -> member 테이블에서 id로 새로운 이름으로 변경 
		Connection conn = connect();
		PreparedStatement ps = conn.prepareStatement(p.getProperty("changeName"));
		ps.setString(1, newName);
		ps.setString(2, id);
		ps.executeQuery();
		
	}
	
}









