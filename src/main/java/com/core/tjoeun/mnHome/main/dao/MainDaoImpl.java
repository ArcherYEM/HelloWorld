package com.core.tjoeun.mnHome.main.dao;

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
	public Map getProfileNoImg(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getProfileNoImg(userNickname);
	}
	
	@Override
	public Map getProfileNoMsg(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getProfileNoMsg(userNickname);
	}
	
	@Override
	public List<Map> getProfileHistory(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getProfileHistory(userNickname);
	}

	@Override
	public List<Map> getMinimi(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getMinimi(userNickname);
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

	@Override
	public Map selectHomeTitle(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.selectHomeTitle(userNickname);
	}

	@Override
	public int insertHomeTitle(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.insertHomeTitle(map);
	}

	@Override
	public int updateHomeTitle(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.updateHomeTitle(map);
	}
	
	@Override
	public Map selectAllTab(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.selectAllTab(userNickname);
	}
	
	@Override
	public Map selectNewTab(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.selectNewTab(userNickname);
	}

	@Override
	public List<Map> getMyFriends(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getMyFriends(userNickname);
	}

	@Override
	public Map mainSkin(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.mainSkin(map);
	}
	
	@Override
	public Map mainMenu(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.mainMenu(map);
	}
}
