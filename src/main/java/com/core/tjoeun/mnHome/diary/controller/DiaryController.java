package com.core.tjoeun.mnHome.diary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.tjoeun.mnHome.diary.service.DiaryService;
import com.core.tjoeun.mnHome.main.service.MainService;

@Controller
public class DiaryController {
	
	@Autowired
	MainService mainService;

	@Autowired
	DiaryService diaryService;
	
	@RequestMapping("/mnHome/diaryView/{userNickname}")
	public String diaryView(@PathVariable String userNickname, Model model) {
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("title", userMap.get("title"));
		
		return "miniHome/diary";
	}
	
	@RequestMapping(value="/mnHome/diaryWriteView/{userNickname}")
	public String diaryWriteView(@PathVariable String userNickname, Model model, Map map) {
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("title", userMap.get("title"));
		
		String diaryAdd;
				
		return "miniHome/diaryWrite";
	}

}
