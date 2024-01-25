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
	public int deleteDiary(Map map) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.deleteDiary(map);
	}

	@Override
	public int modifyDiary(Map map) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.modifyDiary(map);
	}

	@Override
	public int insertDiaryCMT(Map map) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.insertDiaryCMT(map);
	}

	@Override
	public List<HashMap> selectDiaryCMT(String userNickname) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.selectDiaryCMT(userNickname);
	}

	@Override
	public Map diaryTest (Map paramMap) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.diaryTest(paramMap);
	}

	@Override
	public List<HashMap> diaryCmtTest(String seq) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.diaryCmtTest(seq);
	}

	@Override
	public Map selectOne(Map map) {
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		
		return mapper.selectOne(map);
	}

	
}
