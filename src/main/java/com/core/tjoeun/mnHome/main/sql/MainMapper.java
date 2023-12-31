package com.core.tjoeun.mnHome.main.sql;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainMapper {
	
	public Map getProfile(String userNickname);
	
	public List<Map> getProfileHistory(String userNickname);
}
