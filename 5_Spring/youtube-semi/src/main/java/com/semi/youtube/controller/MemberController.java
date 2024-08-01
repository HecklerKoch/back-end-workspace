package com.semi.youtube.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	// 회원가입
	
	// 로그인
	
	
	@GetMapping("/search")
	public String search(String select, String keyword) {
		System.out.println(select);
		System.out.println(keyword);
		return "index";
	}
	
	
}
