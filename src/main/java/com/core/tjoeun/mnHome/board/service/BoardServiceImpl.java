package com.core.tjoeun.mnHome.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.mnHome.board.dao.BoardDao;

@Service
@EnableTransactionManagement
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao boardDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void writeBoard(Map map) throws Exception {
		int result = boardDao.insertBoard(map);
		
		if(result != 1) {
			throw new Exception();
		}
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.REQUIRES_NEW)
	public List<HashMap> getBoardList(Map map) {
		
		Object page = map.get("page");
		
		
		if(null == page || "".equals(page)) {
			map.put("limit", 10);
			map.put("offset",0);
			map.put("page",1);
		}else {
			
			int ipage = Integer.parseInt((String)page);
			map.put("limit", 10);
			map.put("offset", 10 * (ipage-1));
		}
		
		return boardDao.selectBoardList(map);
	}

	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.REQUIRES_NEW)
	public Long getBoardPage(Map map) {
		long total = (Long)boardDao.getBoardPage(map).get("boardTotal");
		long page = (total/10);
		
		if(0 < total%10) {
			page++;
		}
		return page;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void deleteBoard(ArrayList<String> list) {
		
		boardDao.deleteBoard(list);
		
	}
	
	

}
