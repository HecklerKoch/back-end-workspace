package com.kh.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.model.dao.MemberDAO;
import com.kh.model.dao.RentDAO;
import com.kh.model.vo.Member;
import com.kh.model.vo.Rent;

public class MemberController {
	
	private MemberDAO member = new MemberDAO();
	private RentDAO rent = new RentDAO();
	
	// 4. 회원가입
	public boolean registerMember(String id, String password, String name) {
		try {
			member.registerMember(id, password, name);
			return true;
		} catch (SQLException e) {
			return false;
		}
		
	}
	
	// 5. 로그인
	public Member login(String id, String password) {
		try {
			Member m = member.login(id, password);
			if(m.getStatus()=='N') return m;
		} catch (SQLException e) {
			return null;
		}
		return null;
	}
	
	// 5. 회원탈퇴
	public boolean deleteMember(int memberNo) {
		try {
//			ArrayList<Rent> bookList = rent.printRentBook(memberNo);
//			if(bookList.size() > 0) return false;
			
			if(member.deleteMember(memberNo) == 1) return true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
