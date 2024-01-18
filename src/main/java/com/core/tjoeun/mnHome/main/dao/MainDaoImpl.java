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
	public List<Map> getMyBgm(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getMyBgm(userNickname);
	}
	
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
	public List<Map> getMyFriends(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		
		return mapper.getMyFriends(userNickname);
	}
	
	@Override
	public int friendCheck(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.friendCheck(map);
	}

	@Override
	public Map mainSkin(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.mainSkin(map);
	}
	
	@Override
	public int insertFriendCmt(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.insertFriendCmt(map);
	}
	
	@Override
	public List<Map> selectFriendCmt(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.selectFriendCmt(map);
	}
	@Override
	public Map mainMenu(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.mainMenu(map);
	}
	
	@Override
	public Map selectVisitCnt(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.selectVisitCnt(userNickname);
	}

	@Override
	public int updateVisitCnt(Map map) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.updateVisitCnt(map);
	}
	
	@Override
	public List<Map> selectCurrentContent(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.selectCurrentContent(userNickname);
	}

	@Override
	public Map selectUserInfo(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.selectUserInfo(userNickname);
	}

	@Override
	public Map tabs(String userNickname) {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.tabs(userNickname);
	}
}
