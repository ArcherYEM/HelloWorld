package com.core.tjoeun.mnHome.visit.sql;

import java.util.List;
import java.util.Map;

public interface VisitMapper {

	public int insertVisitComment(Map map);
	
	public int selectCnt(String targetNickname);
	
	public List<Map> selectVisitComment(Map paramMap);
	
	public int updateVisitComment(Map map);
	
	public int deleteVisitComment(Map map);

}
