package com.core.tjoeun.index.member.dao;

import java.util.Map;

public interface MemberDao {

	public int insertUserInfo(Map map);
	
	public Map selectUserInfo(Map map);
	
	public Map selectUserId(Map map);
	
	public int updatePw(Map map);
}
