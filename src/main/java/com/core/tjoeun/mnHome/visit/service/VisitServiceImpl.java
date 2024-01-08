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
	public List<Map> selectVisitComment(String targetNickname) {
		
		return visitDao.selectVisitComment(targetNickname);
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