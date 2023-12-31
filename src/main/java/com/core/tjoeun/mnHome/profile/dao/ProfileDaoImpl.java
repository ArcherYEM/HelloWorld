package com.core.tjoeun.mnHome.profile.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.index.member.sql.MemberMapper;
import com.core.tjoeun.mnHome.profile.sql.ProfileMapper;

@Repository
public class ProfileDaoImpl implements ProfileDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int addProfileHistory(Map map) {
		
		ProfileMapper mapper = sqlSession.getMapper(ProfileMapper.class);
		
		return mapper.addProfileHistory(map);		
	}

}
