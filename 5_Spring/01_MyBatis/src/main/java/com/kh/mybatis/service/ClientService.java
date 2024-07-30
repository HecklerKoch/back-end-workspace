package com.kh.mybatis.service;

import org.springframework.stereotype.Service;

import com.kh.mybatis.model.vo.Client;

import mapper.MemberMapper;

@Service
public class ClientService {

	private MemberMapper clientmapper;
	
	public ClientService(MemberMapper clientmapper) {
		this.clientmapper = clientmapper;
	}
	
	public void register(Client client) {
		clientmapper.register(client);
	}
}
