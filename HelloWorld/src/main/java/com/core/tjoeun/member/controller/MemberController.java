package com.core.tjoeun.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	
	@RequestMapping("/member/signUp")
	public String mainHome() {
		
		return "index/signUp";
	}
	
	@RequestMapping("/member/findId")
	public String findId() {
		
		return "index/findId";
	}
	
	@RequestMapping("/member/afterFindId")
	public String afterFineId() {
		
		return "index/afterFindId";
	}
}
