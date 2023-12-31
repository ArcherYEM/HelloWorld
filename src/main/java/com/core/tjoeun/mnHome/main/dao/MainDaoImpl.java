package com.core.tjoeun.mnHome.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.mnHome.main.sql.MainMapper;

@Repository
public class MainDaoImpl implements MainDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public Map getProfile(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getProfile(userNickname);
	}
	
	@Override
	public List<Map> getProfileHistory(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getProfileHistory(userNickname);
	}

}
