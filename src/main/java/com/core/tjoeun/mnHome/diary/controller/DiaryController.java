package com.core.tjoeun.mnHome.diary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		return "miniHome/diaryWrite";
	}
	
	@RequestMapping(value="/mnHome/diaryAdd", method = RequestMethod.POST)
	@ResponseBody
	public Map diaryAdd(@RequestBody  Map map) throws Exception {
			System.out.println("add 실행");
			System.out.println("map : " + map);
			map.put("openScope",1);
			Map resultMap = diaryService.insertDiary(map);
			if(resultMap != null) {
				resultMap.put("resultCode", "1");
				return resultMap;
			} else {
				resultMap.put("resultCode", "0");
				return resultMap;
			}
	}

}
