package com.core.tjoeun.mnHome.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MainService {

	public Map getProfile(String userNickname);
	
	public List<Map> getProfileHistory(String userNickname);
}
