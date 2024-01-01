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

	@Override
	public List<Map> getMinimi() {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getMinimi();
	}

	@Override
	public void resetMinimi(String userNickname) {		
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);	
		
		mapper.resetMinimi(userNickname);
	}

	@Override
	public void insertMinimi(Map<String, Object> minimiData) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);	
		
		mapper.insertMinimi(minimiData);		
	}

	@Override
	public void upsertBackground(Map<String, Object> params) {		
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);	
		
		mapper.upsertBackground(params);		
	}
	
	@Override
	public void resetBackground(String userNickname) {		
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);	
		
		mapper.resetBackground(userNickname);
	}

	@Override
	public List<Map> selectMinimi(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.selectMinimi(userNickname);
	}

	@Override
	public Map selectBackground(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.selectBackground(userNickname);
	}
}
