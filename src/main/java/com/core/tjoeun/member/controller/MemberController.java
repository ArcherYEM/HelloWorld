package com.core.tjoeun.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	
	@RequestMapping(value="/member/signUp")
	public String mainHome() {
		
		return "index/signUp";
	}
	
	@RequestMapping(value="/member/findId")
	public String findId() {
		
		return "index/findId";
	}
	
	@RequestMapping(value="/member/afterFindId")
	public String afterFineId() {
		
		return "index/afterFindId";
	}
	
	@RequestMapping(value="/member/findPw", method = RequestMethod.GET)
	public String findPw() {
		
		return "index/findPw";
	}
	
	@RequestMapping(value="/member/afterFindPw", method = RequestMethod.GET)
	public String afterFindPw() {
		
		return "index/afterFindPw";
	}
	
	
}
