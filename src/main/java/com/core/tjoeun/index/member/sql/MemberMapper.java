package com.core.tjoeun.index.member.sql;

import java.util.Map;

public interface MemberMapper {

	public int insertUserInfo(Map map);
	
	public Map selectUserInfo(Map map);
	
	public Map selectUserId(Map map);
	
	public int updatePw(Map map);
	
	public String selectUserMinimi(String userNickname);
}
