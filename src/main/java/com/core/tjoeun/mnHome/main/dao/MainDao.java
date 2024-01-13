package com.core.tjoeun.mnHome.main.dao;

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
	
	public List<Map> getMyFriends(String userNickname);
	
	public Map mainSkin(Map map);

	public int insertFriendCmt(Map map);
	
	public List<Map> selectFriendCmt(Map map);
	
	public Map mainMenu(Map map);
	
	public Map selectVisitCnt(String userNickname);
	
	public int updateVisitCnt(Map map);
	
	public List<Map> selectCurrentContent(String userNickname);
	
	public Map selectUserInfo(String userNickname);
	
	public Map tabs(String userNickname);
	
}
