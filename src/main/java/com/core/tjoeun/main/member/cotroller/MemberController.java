package com.core.tjoeun.main.member.cotroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.core.tjoeun.main.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/main/member/signUp")
	public String mainHome() {
		
		return "index/signUp";
	}
	
	@RequestMapping(value="/main/member/findId")
	public String findId() {
		
		return "index/findId";
	}
	
	@RequestMapping(value="/main/member/afterFindId")
	public String afterFineId() {
		
		return "index/afterFindId";
	}
	
	@RequestMapping(value="/main/member/findPw", method = RequestMethod.GET)
	public String findPw() {
		
		return "index/findPw";
	}
	
	@RequestMapping(value="/main/member/afterFindPw", method = RequestMethod.GET)
	public String afterFindPw() {
		
		return "index/afterFindPw";
	}
	
	@RequestMapping(value="/main/member/signUpConfirm", method = RequestMethod.POST)
	public String signUp(@RequestParam Map map) throws Exception {
		memberService.signUp(map);
		return "redirect:/";
	}
	
	
}
