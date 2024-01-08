package com.core.tjoeun.mnHome.setting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SettingService {

	List<Map<String, Object>> selectSettingUserStorage(String userNickname) throws Exception;
	
	public void updateAllocationOff(Map map) throws Exception;
	
	public void updateAllocationOn(Map minimiMap) throws Exception;

	public Map getSearchUser(Map map) throws Exception;
	
	public void insertFriendRequest(Map map) throws Exception;
	
	public List<HashMap> selectFriends(Map map);
}
