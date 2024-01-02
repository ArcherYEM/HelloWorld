package com.core.tjoeun.index.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	public void writeNotice(Map map) throws Exception;
	
	public List<HashMap> getNoticeList(Map map);
	
	public void deleteNotice(ArrayList<String> list) throws Exception;
	
	public long getPage();
	
	
	
}
