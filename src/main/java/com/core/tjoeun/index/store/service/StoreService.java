package com.core.tjoeun.index.store.service;

import java.util.List;
import java.util.Map;

public interface StoreService {

	public List<Map> getBgmList(Map map) throws Exception;
	
	public List<Map> searchBgm(Map map) throws Exception;
	
	public long selectStoreCnt(Map map);
	
	public List<Map> getStroeMinimiList(Map map);
	
	public int insertDotoriC(Map map);
	
	public String selectDotori(String userNickname);
	
	public int insertDotori(Map map);
	
	public int updateDotori(Map map);

}
