package com.core.tjoeun.index.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.index.store.dao.StoreDao;

@Service
@EnableTransactionManagement
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao storeDao;

	@Override
	@Transactional(readOnly= false)
	public List<Map> getBgmList(Map map) throws Exception {
		if(storeDao.getBgmList(map)==null) {
			throw new Exception();
		}
		return storeDao.getBgmList(map);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public int putBgm(Map map) {
		return storeDao.putBgm(map);
	}
	
	@Override
	public long selectStoreCnt(Map map) {
		long totalCnt = (long) storeDao.selectStoreCnt(map).get("totalCnt");
		long page = (totalCnt / 10);
		
		if (totalCnt % 10 > 0) {
			page++;
		}
		return page;
	}
	
	@Override
	public List<Map> getStroeMinimiList(Map map) {
	    Map minimiMap = new HashMap();
	    Object pageObj = map.get("page");
	    if (pageObj != null && !pageObj.toString().isEmpty()) {
	        int iPage = Integer.parseInt(pageObj.toString());
	        minimiMap.put("limit", 10);
	        minimiMap.put("offset", 10 * (iPage - 1));
	    }
	    return storeDao.getStroeMinimiList(minimiMap);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public int insertDotoriC(Map map) {
		return storeDao.insertDotoriC(map);
	}
	
	@Override
	@Transactional(readOnly= true)
	public String selectDotori(String userNickname) {
		
		return storeDao.selectDotori(userNickname);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public int insertDotori(Map map) {
		return storeDao.insertDotori(map);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public int updateDotori(Map map) {
		return storeDao.updateDotori(map);
	}

	@Override
	@Transactional(readOnly = true)
	public int getMyDotori(String userNickname) {
		return storeDao.getMyDotori(userNickname);
	}
	
}
