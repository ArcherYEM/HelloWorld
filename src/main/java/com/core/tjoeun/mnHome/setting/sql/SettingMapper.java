package com.core.tjoeun.mnHome.setting.sql;

import java.util.Map;

public interface SettingMapper {
	
	public Map selectSettingUserStorage(Map map);
	
	String getContentPath(Map map) throws Exception;

}
