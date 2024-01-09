package com.core.tjoeun.index.store.dao;

import java.util.List;
import java.util.Map;

public interface StoreDao {

	public List<Map> getBgmList(Map map);
	
	public int putBgm(Map map);
	
	public List<Map> getStoreMinimiList(Map map);
	
	public Map selectStoreCnt(Map map);
	
	public int insertDotoriC(Map map);
	
	public String selectDotori(String userNickname);
	
	public int insertDotori(Map map);
	
	public int updateDotori(Map map);
	
	public int deductDotori(Map map);
	
	public int getMyDotori(String userNickname);
	
	public int insertBuyCart(Map map);
	
	public int updateBuyCartDotoriCnt(Map map);
	
	public int getCartItemDuplicateCount(Map map);
}
