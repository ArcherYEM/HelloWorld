package com.core.tjoeun.index.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.index.member.sql.MemberMapper;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertUserInfo(Map map) {
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserInfo(map);
	}

	@Override
	public Map selectUserInfo(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.selectUserInfo(map);
	}

	@Override
	public Map selectUserId(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.selectUserId(map);
	}

	@Override
	public int updatePw(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.updatePw(map);
	}

	@Override
	public String selectUserMinimi(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.selectUserMinimi(userNickname);
	}
	
	@Override
	public int insertUserDotori(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserDotori(userNickname);
		
	}

	@Override
	public int insertUserDotoriC(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserDotoriC(map);
		
	}

	@Override
	public int insertMiniroomBackground(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertMiniroomBackground(userNickname);
		
	}

	@Override
	public int insertMiniroomMinimi(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertMiniroomMinimi(userNickname);
		
	}

	@Override
	public int insertMinihomeTitle(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertMinihomeTitle(userNickname);
		
	}

	@Override
	public int insertUserProfile(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserProfile(userNickname);
		
	}

	@Override
	public int insertUserStorage(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserStorage(userNickname);
		
	}

	@Override
	public String selectUserName(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.selectUserName(userNickname);
	}

	@Override
	public int selectRequest(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.selectRequest(userNickname);
	}

	@Override
	public int insertLoginStatus(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertLoginStatus(userNickname);
	}
	
	@Override
	public int selectOnFriendCnt(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.selectOnFriendCnt(userNickname);
	}
	
	@Override
	public int insertLoginLog(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertLoginLog(userNickname);
	}

	@Override
	public int loginOnStatus(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.loginOnStatus(userNickname);
	}
	
	@Override
	public int loginOffStatus(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.loginOffStatus(userNickname);
	}
	
	@Override
	public int insertUserStorageSkin(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserStorageSkin(userNickname);
	}
	
	@Override
	public int insertUserStorageMenu(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserStorageMenu(userNickname);
	}
	
	@Override
	public int insertVisitCnt(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertVisitCnt(userNickname);
	}
	
	@Override
	public String selectUserGender(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.selectUserGender(userNickname);
	}

	@Override
	public Map getFriendCount(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.getFriendCount(userNickname);
	}
}
