package com.core.tjoeun.index.notice.sql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface NoticeMapper {
	
	public int insertNotice(Map map);

	public List<HashMap> selectNotice(Map map);
	
	public int deleteNotice(ArrayList<String> list);
	
	public Map getTotalPage();
	
	public int modifyNotice(Map map);
}
