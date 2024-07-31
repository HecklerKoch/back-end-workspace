package com.kh.mybatis.controller;

import java.lang.reflect.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.mybatis.model.vo.Client;
import com.kh.mybatis.service.ClientService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientController {
	
	@Autowired
	private ClientService service;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("allClient", service.allClient());
		return "index";
	}
	
	@GetMapping ("/register")
	public String register() {
		return "mypage/register";
	}
	
	@PostMapping("/register")
	public String register(Client vo) {
		service.register(vo);
		return "redirect:/";
	}
	
	@GetMapping("/login")
	public String login() {	
			return "mypage/login";
	}
	
	@PostMapping("/login")
	public String login(Client vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("vo", service.login(vo));
		return "redirect:/";
	}
	
	@GetMapping ("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("vo", service.logout(vo));
		return "redirect:/";
	}
	
	@PostMapping("/update")
	public String update(Member vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Client client = (Client) session.getAttribute("vo");
		if(vo.getName()==null) {
			vo.setId(client.getId());
			vo.setName(client.getName());
			service.updatePwd(vo);
		} else {
			service.update(vo);
		}
	}
	public String update(Client vo ) {
		return "redirect/";
	}
	
	
	}
	

