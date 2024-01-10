package com.core.tjoeun.mnHome.board.service;

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
	@Transactional(readOnly = true)
	public List<HashMap> getBoardList(Map map) {
		
		return boardDao.selectBoardList(map);
	}

}
