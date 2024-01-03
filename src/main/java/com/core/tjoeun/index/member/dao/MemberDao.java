package com.core.tjoeun.index.member.dao;

import java.util.Map;

public interface MemberDao {

	public int insertUserInfo(Map map);
	
	public Map selectUserInfo(Map map);
	
	public Map selectUserId(Map map);
	
	public int updatePw(Map map);
	
	public String selectUserMinimi(String userNickname);
	
	public int insertUserDotori(String userNickname);

	public int insertUserDotoriC(String userNickname);
	
	public int insertMiniroomBackground(String userNickname);
	
	public int insertMiniroomMinimi(String userNickname);
	
	public int insertMinihomeTitle(String userNickname);

	public int insertUserProfile(String userNickname);
	
	public int insertUserStorage(String userNickname);
}
