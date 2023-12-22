package com.core.tjoeun.main.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.main.member.dao.MemberDao;

@Service
@EnableTransactionManagement
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public void signUp(Map map) throws Exception {
		int result = memberDao.insertUserInfo(map);
		if(result != 1) {
			throw new Exception();
		}
	}

	@Override
	@Transactional(readOnly = true)
	public Map login(Map map) throws Exception {
		
		return memberDao.selectUserInfo(map);
	}
}
