package com.kh.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.movie.model.vo.Movie;

import mapper.MovieMapper;

@Service
public class MovieService {
	
	@Autowired
	private MovieMapper map;
	
	public void add(Movie vo) {
		map.add(vo);
	}
	
	public List<Movie> query() {
		return map.query();
	}

}
