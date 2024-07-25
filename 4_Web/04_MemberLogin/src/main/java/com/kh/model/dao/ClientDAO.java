package com.kh.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Client.vo.Client;

public class ClientDAO {
	
	public ClientDAO () {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection connect() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/client", "root", "qwer1234");
	}
	
	public void close(PreparedStatement ps, Connection conn) throws SQLException {
		ps.close();
		conn.close();
	}
	
	public void close(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException {
		rs.close();
		close(ps, conn);
	}
	
	
	// DAO 개발할 때 중요한 건
	// 매개변수(파라미터) 뭘 가지고 와야 되는지, 리턴타입 결과 출력이 어떤게 필요한지
	
	// 회원가입
	public void register(String id, String password, String name) throws SQLException {
		Connection conn = connect();
		String query = "INSERT INTO client VALUES (?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, id);
		ps.setString(2, password);
		ps.setString(3, name);
		ps.executeUpdate();
		
		close(ps, conn);
	}
	
	//로그인
	public Client login(String id, String password) throws SQLException {
		Connection conn = connect();
		
		String query = "SELECT * FROM client WHERE id = ? AND password = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setString(1, id);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		Client client = null;
		
		if(rs.next()) {
			client = new Client(id, password, rs.getString("name"));
		}
		
		close(rs, ps, conn);
		
		return client;	
		
	}
	
	// 회원검색
	public Client searchClient(String id) throws SQLException {
		Connection conn = connect();
		
		String query = "SELECT * FROM client WHERE id = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		Client client = null;
		if(rs.next())
			client = new Client(id, rs.getString("password"), rs.getString("name"));
		
		close(rs, ps, conn);
		return client;
	}
	
	//전체 회원검색
	public ArrayList<Client> showAllClient() throws SQLException {
		Connection conn = connect();
		
		String query = "SELECT * FROM client";
		PreparedStatement ps = conn.prepareStatement(query);
		
		ResultSet rs = ps.executeQuery();
		
		List<Client> Clientlist = new ArrayList<>();
		
		while(rs.next()) {
			Clientlist.add(new Client(rs.getString("id"),
								rs.getString("password"),
								rs.getString("name")));
		}
		
		close(rs, ps, conn);
		
		return (ArrayList<Client>) Clientlist;
		
	}
	
}
