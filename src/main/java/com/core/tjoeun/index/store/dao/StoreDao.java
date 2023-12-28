package com.core.tjoeun.index.store.dao;

import java.util.List;
import java.util.Map;

public interface StoreDao {

	public List<Map> getBgmList(Map map);
	
	public List<Map> searchBgm(Map map);
}
