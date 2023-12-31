package com.core.tjoeun.mnHome.setting.dao;

import java.util.Map;

public interface SettingDao {

	public Map selectSettingUserStorage(Map map);
	
	String getContentPath(Map map) throws Exception;
}
