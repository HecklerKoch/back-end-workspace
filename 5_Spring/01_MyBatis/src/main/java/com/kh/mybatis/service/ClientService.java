package com.kh.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mybatis.model.vo.Client;

import mapper.MemberMapper;

@Service
public class ClientService {

	@Autowired
	private MemberMapper clientmapper;
	
	public void register(Client client) {
		clientmapper.register(client);
	}
	
	public List<Client> allClient() {
		return clientmapper.allClient();
	}
	
	public Client login(Client client) {
		return clientmapper.login(client);
	}
	
	public void updatePwd
}
