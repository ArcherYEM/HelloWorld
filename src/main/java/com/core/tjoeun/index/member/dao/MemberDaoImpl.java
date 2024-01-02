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
}
