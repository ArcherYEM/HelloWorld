package com.core.tjoeun.index.store.sql;

import java.util.List;
import java.util.Map;

public interface StoreMapper {

	public List<Map> getBgmList(Map map);
	
	public List<Map> searchBgm(Map map);
	
	public int putBgm(Map map);

	public List<Map> getStroeMinimiList(Map map);
	
	public Map selectStoreCnt(Map map);
	
	public int insertDotoriC(Map map);
	
	public String selectDotori(String userNickname);
	
	public int insertDotori(Map map);
	
	public int updateDotori(Map map);
}
