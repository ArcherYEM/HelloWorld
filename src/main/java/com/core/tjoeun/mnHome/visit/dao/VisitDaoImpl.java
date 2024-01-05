package com.core.tjoeun.mnHome.visit.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.mnHome.setting.sql.SettingMapper;
import com.core.tjoeun.mnHome.visit.sql.VisitMapper;

@Repository
public class VisitDaoImpl implements VisitDao {

    @Autowired
    SqlSession sqlSession;

	@Override
	public int insertVisitComment(Map map) {
		VisitMapper mapper = sqlSession.getMapper(VisitMapper.class);
		
		return mapper.insertVisitComment(map);
	}

	@Override
	public List<Map> selectVisitComment(String targetNickname) {
		VisitMapper mapper = sqlSession.getMapper(VisitMapper.class);
		
		return mapper.selectVisitComment(targetNickname);
	}
	
	@Override
	public int updateVisitComment(Map map) {
		VisitMapper mapper = sqlSession.getMapper(VisitMapper.class);
		
		return mapper.updateVisitComment(map);
	}
	
	@Override
	public int deleteVisitComment(Map map) {
		VisitMapper mapper = sqlSession.getMapper(VisitMapper.class);
		
		return mapper.deleteVisitComment(map);
	}

}
