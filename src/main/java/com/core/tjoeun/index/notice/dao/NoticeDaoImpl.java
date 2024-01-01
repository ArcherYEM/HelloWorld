package com.core.tjoeun.index.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.index.notice.sql.NoticeMapper;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertNotice(Map map) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
	
		return mapper.insertNotice(map);
	}

	@Override
	public List<HashMap> selectNotice(Map map) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		
		return mapper.selectNotice(map);
	}

	@Override
	public int deleteNotice(Map map) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		
		return mapper.deleteNotice(map);
	}

	@Override
	public Map getTotalPage() {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		
		return mapper.getTotalPage();
	}

}