package com.core.tjoeun.mnHome.visit.sql;

import java.util.List;
import java.util.Map;

public interface VisitMapper {

	public int insertVisitComment(Map map);
	
	public List<Map> selectVisitComment(String targetNickname);
	
	public int updateVisitComment(Map map);
	
	public int deleteVisitComment(Map map);

}
