package com.core.tjoeun.index.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	public void writeNotice(Map map) throws Exception;
	
	public List<HashMap> getNoticeList(Map map);
	
	public void deleteNotice(Map map);
	
	public long getPage();
	
	
	
}
