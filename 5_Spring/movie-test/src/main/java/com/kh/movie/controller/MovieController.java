package com.kh.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.movie.model.vo.Movie;
import com.kh.movie.service.MovieService;

@Controller
public class MovieController {

	@Autowired
	private MovieService service;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("List", service.query());
		return "index";
	}
	
	@GetMapping("/add")
	public String add() {
		return "add";
	}
	@PostMapping("/add")
	public String show(Movie vo) {
	   service.add(vo);
	   return "redirect:/";
	}
	
}
