package com.core.tjoeun.index.member.service;

import java.util.Map;

public interface MemberService {

	public void signUp(Map map) throws Exception;
	
	public Map login(Map map) throws Exception ;
}
