package com.kh.upload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.upload.model.vo.Board;

import mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	public void insert(Board vo) {
		mapper.insert(vo);
	}
	
	public List<Board> selectAll() {
		return mapper.selectAll();
	}
	
	public int total() {
		return mapper.total();
	}
	
	public Board select(int no) {
		
		return mapper.select(no);
		
	}
	
	public void update(Board vo) {
		mapper.update(vo);
	}
	
	public void delete(int no) {
		mapper.delete(no);
	}
}
