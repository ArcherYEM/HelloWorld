package com.core.tjoeun.helloworld.minihome.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorldDaoImpl implements WorldDao{
	
	@Autowired
	SqlSession sqlSession;

}
