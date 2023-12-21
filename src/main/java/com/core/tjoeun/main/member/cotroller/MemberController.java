package com.core.tjoeun.main.member.cotroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.core.tjoeun.main.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/main/member/login", method = RequestMethod.POST)
	public String login(@RequestParam Map map, Model model) throws Exception {
		Map resultMap = new HashMap();
		resultMap = memberService.login(map);
		if(resultMap != null) {
			model.addAttribute("loginResult", resultMap);
			return "index/loginHome";
		} else {
			model.addAttribute("loginResult", 0);
			return "home";
		}
	}
	
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
