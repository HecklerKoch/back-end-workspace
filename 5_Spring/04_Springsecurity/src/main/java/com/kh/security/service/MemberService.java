package com.kh.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.security.model.vo.Member;

import mapper.MemberMapper;

// Spring Security에서 제공하는 UserDetailsService 엔터페이스 상속

@Service
public class MemberService implements UserDetailsService{

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder bcpe;
	
	public void register(Member vo) {
//		System.out.println("암호화 전 : " + vo.getPassword());
//		System.out.println("암호화 후 : " + bcpe.encode(vo.get	Password()));
		
		
		vo.setPassword((bcpe.encode(vo.getPassword())));
		//vo.setRole("ROLE_MEMBER");
		vo.setRole("ROLE_ADMIN");
		mapper.register(vo);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return member.check(username);
		
	}
	
}
