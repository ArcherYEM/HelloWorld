package com.core.tjoeun.index.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.index.store.sql.StoreMapper;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Map> getBgmList() {
		
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		
		return mapper.getBgmList();
	}
}
