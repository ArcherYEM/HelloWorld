package com.core.tjoeun.index.store.service;

import java.util.List;
import java.util.Map;

public interface StoreService {
	
	public int getBgmAll();

	public List<Map> getBgmList(Map map) throws Exception;
		
	public int putBgm(Map map) throws Exception;
	
	public long selectStoreCnt(Map map);
	
	public List<Map> getStoreMinimiList(Map map);
	
	public int insertDotoriC(Map map);
	
	public String selectDotori(String userNickname);
	
	public int insertDotori(Map map);
	
	public int updateDotori(Map map);
	
	public int deductDotori(Map map);
	
	public int getMyDotori(String userNickname);
	
	public int buyCart(Map map) throws Exception;
	
	public int updateBuyCartDotoriCnt(Map map) throws Exception;

}
