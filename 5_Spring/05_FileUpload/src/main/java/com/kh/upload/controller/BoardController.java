package com.kh.upload.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.upload.model.vo.Board;
import com.kh.upload.service.BoardService;

import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping("/")
	public String index() {
		return "index";
		
	}
	
	public String fileUpload(MultipartFile file) throws IllegalStateException, IOException {
		// 중복 방지를 위한 UUID 적용
				UUID uuid = UUID.randomUUID();
				String fileName = uuid.toString() + "_" + file.getOriginalFilename();
				
				File copyFile = new File("D:\\upload\\" + fileName);
				file.transferTo(copyFile); // 업로드한 파일이 지정한 path 위치로 저장
				return fileName;
	}
	
	@PostMapping("/upload")
	public String upload(MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("upload");
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 사이즈 : " + file.getSize());
		System.out.println("파일 파라미터명 : " + file.getName());
		
		// 중복 방지를 위한 UUID 적용
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String fileName = uuid.toString() + "_" + file.getOriginalFilename();
		
		File copyFile = new File("\\\\192.168.10.51\\upload\\" + fileName);
		file.transferTo(copyFile); // 업로드한 파일이 지정한 path 위치로 저장
		return fileName;
	}
	
	@PostMapping("/multiUpload")
	public String mulitUpload(List<MultipartFile> files) throws IllegalStateException, IOException {
		for(MultipartFile file : files) {
			fileUpload(file);
		}
		
		return "redirect:/";
	}
	

	@GetMapping("/list")
	public String list(Model model) {
		
		List<Board> list = service.selectAll();
		
		for(Board b: list) {
			LocalDateTime date = b.getDate();
			Date formatDate = Date.from(date.atZone(ZoneId.systemDefault()).toInstant());
			b.setFormatDate(formatDate);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paging", new Paging(paging.getPage(), service.total());
		
		return "list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
	@PostMapping("/write")
	public String write(Board vo) throws IllegalStateException, IOException {	
		// 1. 파일 업로드 처리
		String url = fileUpload(vo.getFile());
		vo.setUrl(url);
		
		// 2. 해당 파일 URL과 함께 title, content DB에 저장
		service.insert(vo);
		
		System.out.println(vo);
		
		return "redirect:/view?no=" + vo.getNo();
	}
	
	@GetMapping("/view")
	public String view(int no, Model model) {
		model.addAttribute("board", service.select(no));
		return "view";
	}
	
	@PostMapping("/update")
	public String update(Board vo) {
		System.out.println(vo);
		
		System.out.println(vo.getFile().isEmpty());
		if(vo.getFile().isEmpty()) {
			// 없다면 기존 이미지 url 그래도 DB에 저장
			if(vo.getUrl()!=null) {//기존 이미지가 null이 아닌 경우	
			File file = new File(path + board.getUrl());
			file.delete();
			
		}
		// title, content, url, no
		return "redirect:/list";
	}
	
	@GetMapping("/delete")
	public String delete(int no) {
		if(board.getUrl())
		
		return "redirect://list";
	}
	}
	
	
	
	
}
