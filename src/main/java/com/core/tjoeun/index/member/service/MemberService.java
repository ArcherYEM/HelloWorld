package com.core.tjoeun.index.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface MemberService {

	public void signUp(Map map) throws Exception;
	
	public Map login(Map map) throws Exception ;

	void logout(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	
	public Map findId(Map map);

	public Map selectEmail(Map map);

	public Map selectPhone(Map map);
	
	public void updatePw(Map map) throws Exception;
	
	public String selectUserMinimi(String userNickname);
	
	public String getUserName(String userNickname);
	
	public int selectRequest(String userNickname);
	
}
