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
	public List<Map> getBgmList(Map map) {		
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.getBgmList(map);
	}

	@Override
	public List<Map> searchBgm(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.searchBgm(map);
	}
		
	@Override
	public List<Map> getStroeMinimiList(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.getStroeMinimiList(map);
	}

	@Override
	public Map selectStoreCnt(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.selectStoreCnt(map);
	}
}
