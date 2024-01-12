package com.core.tjoeun.mnHome.main.service;

import java.util.List;
import java.util.Map;

public interface MainService {

	public Map getProfile(String userNickname);
	
	public List<Map> getProfileHistory(String userNickname);
	
	public List<Map> getMinimi(String userNickname);
	
	public void resetMinimi(String userNickname);
	
	public void insertMinimi(Map<String, Object> minimiData);
	
	public void resetBackground(String userNickname);
	
	public void upsertBackground(Map<String, Object> params);
	
	public List<Map> selectMinimi(String userNickname);
	
	public Map selectBackground(String userNickname);
	
	public Map getHomeTitle(String userNickname);
	
	public void updateHomeTitle(Map map) throws Exception;
	
	public Map getUserInfo(String userNickname);
	
	public Map selectAllTab(String userNickname);
	
	public Map selectNewTab(String userNickname);
	
	public List<Map> getMyFriends(String userNickname);
	
	public Map mainSkin(Map map);
	
	public int insertFriendCmt(Map map) throws Exception;
	
	public List<Map> selectFriendCmt(Map map) throws Exception;
	
	public Map mainMenu(Map map);
	
}
