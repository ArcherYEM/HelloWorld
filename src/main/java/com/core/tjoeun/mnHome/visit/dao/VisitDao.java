package com.core.tjoeun.mnHome.visit.dao;

import java.util.List;
import java.util.Map;

public interface VisitDao {

	public int insertVisitComment(Map map);
	
	public List<Map> selectVisitComment(String targetNickname);
	
	public int updateVisitComment(Map map);
	
	public int deleteVisitComment(Map map);

}