package com.kh.security.model.vo;

import java.util.ArrayList;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Builder
public class Member {

	private String id;
	private String password;
	private String name;
	private String role;
	
}

@Override
public Collection<? extends GrantedAuthority> getAuthorities() {
	ArrayList<GranteAuthority> authlist = new ArrayList<>();
	authlist.add(new SimpleGrantedAuthority(role));
}