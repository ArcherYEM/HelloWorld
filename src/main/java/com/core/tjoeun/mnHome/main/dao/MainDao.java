package com.core.tjoeun.mnHome.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainDao {

	public Map getProfile(String userNickname);
	
	public List<Map> getProfileHistory(String userNickname);
}
