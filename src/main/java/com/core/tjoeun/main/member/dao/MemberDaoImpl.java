package com.core.tjoeun.main.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.main.member.sql.MemberMapper;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertUserInfo(Map map) {
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.insertUserInfo(map);
	}

}
