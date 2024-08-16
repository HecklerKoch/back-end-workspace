package com.kh.security.model.vo;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// Spring Security에서 제공하는 UserDetails 인터페이스 상속

@Data @NoArgsConstructor @AllArgsConstructor
@Builder
public class Member Implement UserDetail{

	private String id;
	private String password;
	private String name;
	private String role;
	
}

@Override
public Collection<? extends GrantedAuthority> getAuthorities() {
		return Collections.emptyList();
}

@Override
public String getUsername() {
	return id;
}