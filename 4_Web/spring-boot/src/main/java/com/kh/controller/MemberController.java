package com.kh.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.model.vo.Client;
import com.kh.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("register")
	public void register() {
	}
	
	@PostMapping("register")
	public String register(Client vo) {
		try {
			service.register(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect/";
	}
	
	@GetMapping("login")
	public void login() {}
	
	@PostMapping ("login")
	public String login(Client vo, HttpServletRequest request) {
		try {
			Client client = service.login(vo);
			HttpSession session = request.getSession();
			session.setAttribute("pi", client);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	
	}
	
	@GetMapping("search")
	public void search() {
		
	}
	
	@GetMapping("find")
	public String find(String id, Model model) {
		System.out.println(id);
	try {
		Client client = service.searchClient(id);
		
		if(client!=null) {
			model.addAttribute("client", client);
			return "search_ok";
		}
		
	} catch(Exception e) {}
	
	return "redirect:/fail";
	
  }
	
	@GetMapping("fail")
	public String fail() {
		return "search_fail";
	}
	
	@GetMapping("allMember")
	public String allMember(Model model) {
		
		try {
		List<Client> list = service.showAllClient();
		model.addAttribute("list", list);
		System.out.println(list);
	} catch(Exception e) {}
		
		
		return "allMember";
		
	}
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Client client = (Client) session.getAttribute("pi");
		if(client!=null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	
}
	
