package com.core.tjoeun.index.store.service;

import java.util.List;
import java.util.Map;

public interface StoreService {

	public List<Map> getBgmList(Map map) throws Exception;
	
	public List<Map> searchBgm(Map map) throws Exception;
}
