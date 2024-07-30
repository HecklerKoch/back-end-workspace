package com.kh.mybatis.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class Client {
	
	private String id;
	private String password;
	private String name;
}
