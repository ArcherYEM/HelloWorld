package com.core.tjoeun.mnHome.diary.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.mnHome.diary.sql.DiaryMapper;

@Repository
public class DiaryImpl implements DiaryDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertDiary(Map map) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.insertDiary(map);
	}

	@Override
	public Map selectDiary(Map map) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.selectDiary(map);
	}

	@Override
	public int deleteDiary(ArrayList<String> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyDiary(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
