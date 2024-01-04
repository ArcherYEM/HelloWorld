package com.core.tjoeun.mnHome.diary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.main.service.MainService;

@Controller
public class DiaryController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	MainService mainService;
			
	@RequestMapping("/mnHome/diaryView")
	public String diary(Model model) {
		
		return "miniHome/diary";
	}
	
	@RequestMapping(value="/mnHome/diaryWriteView")
	public String diaryWrite() {
		
				
		return "miniHome/diaryWrite";
	}
	
	
	@RequestMapping("/mnHome/diaryView/{userNickname}")
	public String diaryView(@PathVariable String userNickname, Model model) {
//		//홈피 주인 이름 가져오기 
//		String userName = memberService.getUserName(userNickname);
//		model.addAttribute("userName", userName);
//				
//		//Home Title
//		Map title = mainService.getHomeTitle(userNickname);
//		if(title != null) {
//			model.addAttribute("title", title.get("title"));
//		}else {
//			model.addAttribute("title", userName + "의 미니홈피입니다.");
//		}
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		return "miniHome/diary";
	}
	
	@RequestMapping(value="/mnHome/diaryWriteView/{userNickname}")
	public String diaryWriteView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
				
		return "miniHome/diaryWrite";
	}
	
	
	
	
	

}
