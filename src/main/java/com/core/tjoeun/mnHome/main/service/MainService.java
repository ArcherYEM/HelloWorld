package com.core.tjoeun.mnHome.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainService {

	public Map getProfile(String userNickname);
	
	public List<Map> getProfileHistory(String userNickname);
	
	public List<Map> getMinimi();
	
	public void resetMinimi(String userNickname);
	
	public void insertMinimi(Map<String, Object> minimiData);
	
	public void resetBackground(String userNickname);
	
	public void upsertBackground(Map<String, Object> params);
	
	public List<Map> selectMinimi(String userNickname);
	
	public Map selectBackground(String userNickname);
}
