package com.kh.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.model.dao.ClientDAO;
import com.kh.model.vo.Client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class MemberService {

	@Autowired
	private ClientDAO dao;
	
	public void register(Client vo) throws SQLException {
			dao.register(vo.getId(), vo.getPassword(), vo.getName());
	}

	public Client login(Client vo) throws SQLException {
			return dao.login(vo.getId(), vo.getPassword());
	}

	public Client searchClient(String id) throws SQLException {
		return dao.searchClient(id);
	}

	public List<Client> showAllClient() throws SQLException {
		return dao.showAllClient();
	}
}
