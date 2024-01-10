package com.core.tjoeun.mnHome.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainDao {

	public Map getProfile(String userNickname);
	
	public List<Map> getProfileHistory(String userNickname);
	
	public Map getProfileNoImg(String userNickname);
	
	public Map getProfileNoMsg(String userNickname);
	
	public List<Map> getMinimi(String userNickname);
	
	public void resetMinimi(String userNickname);
	
	public void insertMinimi(Map<String, Object> minimiData);
	
	public void resetBackground(String userNickname);
	
	public void upsertBackground(Map<String, Object> params);
	
	public List<Map> selectMinimi(String userNickname);
	
	public Map selectBackground(String userNickname);
	
	public Map selectHomeTitle(String userNickname);
	
	public int insertHomeTitle(Map map);
	
	public int updateHomeTitle(Map map);
	
	public Map selectAllTab(String userNickname);
	
	public Map selectNewTab(String userNickname);
	
	public List<Map> getMyFriends(String userNickname);
	
	public Map mainSkin(Map map);
}
