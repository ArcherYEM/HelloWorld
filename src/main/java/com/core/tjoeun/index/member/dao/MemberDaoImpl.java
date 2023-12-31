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
	public int insertUserDotoriC(String userNickname) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserDotoriC(userNickname);
		
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
}
