package com.kh.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.model.dao.ClientDAO;
import com.kh.model.vo.Client;

@Controller
public class MemberController {

	@Autowired
	private ClientDAO dao;
	
	@GetMapping("register")
	public void register() {
	}
	
	@PostMapping("register")
	public String register(Client vo) {
		try {
			dao.register(vo.getId(), vo.getPassword(), vo.getName());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect/";
	}
}
