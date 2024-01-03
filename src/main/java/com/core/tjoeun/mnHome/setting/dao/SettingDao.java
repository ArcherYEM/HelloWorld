package com.core.tjoeun.mnHome.setting.dao;

import java.util.List;
import java.util.Map;

public interface SettingDao {

	List<Map<String, Object>> selectSettingUserStorage(String userNickname);
	
	public void updateAllocationOff(Map map);
	
	public void updateAllocationOn(Map minimiMap);
	
	public Map selectSearchUser(Map map);
}
