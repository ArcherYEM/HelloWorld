package com.core.tjoeun.index.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface NoticeDao {

	public int insertNotice(Map map);
	
	public List<HashMap> selectNotice(Map map);
	
	public int deleteNotice(Map map);
	
	public Map getTotalPage();
}
