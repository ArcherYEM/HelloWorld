package com.core.tjoeun.index.store.sql;

import java.util.List;
import java.util.Map;

public interface StoreMapper {

	public List<Map> getBgmList(Map map);
	
	public List<Map> searchBgm(Map map);

	public List<Map> getProductList(Map map);
}
