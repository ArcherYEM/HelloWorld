package com.core.tjoeun.mnHome.visit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.mnHome.visit.dao.VisitDao;

@Service
@EnableTransactionManagement
public class VisitServiceImpl implements VisitService {

	@Autowired
	VisitDao visitDao;
	
	@Override
	@Transactional(readOnly = false)
	public int insertVisitComment(Map map) {
		
		return visitDao.insertVisitComment(map);
	}

	@Override
	public int selectCnt(String targetNickname) {
		
		return visitDao.selectCnt(targetNickname);
	}

	@Override
	public List<Map> selectVisitComment(Map paramMap) {
		
		return visitDao.selectVisitComment(paramMap);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int updateVisitComment(Map map) {
		
		return visitDao.updateVisitComment(map);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = {Exception.class})
	public int deleteVisitComment(Map map) {
		
		return visitDao.deleteVisitComment(map);
	}

}