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
	public int getBgmAll() {		
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.getBgmAll();
	}
	
	@Override
	public List<Map> getBgmList(Map map) {		
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.getBgmList(map);
	}
	
	@Override
	public int putBgm(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.putBgm(map);
	}
		
	@Override
	public List<Map> getStoreMinimiList(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.getStoreMinimiList(map);
	}

	@Override
	public Map selectStoreCnt(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.selectStoreCnt(map);
	}

	@Override
	public int insertDotoriC(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.insertDotoriC(map);
	}

	@Override
	public String selectDotori(String userNickname) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.selectDotori(userNickname);
	}

	@Override
	public int insertDotori(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.insertDotori(map);
	}

	@Override
	public int updateDotori(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.updateDotori(map);
	}

	@Override
	public int getMyDotori(String userNickname) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.getMyDotori(userNickname);
	}

	@Override
	public int deductDotori(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.deductDotori(map);
	}

	@Override
	public int insertBuyCart(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.insertBuyCart(map);
	}

	@Override
	public int updateBuyCartDotoriCnt(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.updateBuyCartDotoriCnt(map);
	}
	
	@Override
	public int getCartItemDuplicateCount(Map map) {
		StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
		return mapper.getCartItemDuplicateCount(map);
	}
}
