package com.core.tjoeun.mnHome.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.mnHome.board.sql.BoardMapper;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertBoard(Map map) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		return mapper.insertBoard(map);
	}

	@Override
	public List<HashMap> selectBoardList(Map map) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		return mapper.selectBoardList(map);
	}

	@Override
	public Map getBoardPage(Map map) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		return mapper.getBoardPage(map);
	}

	@Override
	public int deleteBoard(ArrayList<String> list) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		return mapper.deleteBoard(list);
	}
	
	@Override
	public int checkFriend(Map checkMap) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		return mapper.checkFriend(checkMap);
	}

}
