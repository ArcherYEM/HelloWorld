package com.core.tjoeun.index.member.sql;

import java.util.Map;

public interface MemberMapper {

	public int insertUserInfo(Map map);
	
	public Map selectUserInfo(Map map);
}
