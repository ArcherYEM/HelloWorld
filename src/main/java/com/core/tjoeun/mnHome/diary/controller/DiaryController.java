package com.core.tjoeun.mnHome.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {
	
	@RequestMapping(value="/miniHome/diary")
	public String diaryView() {
		
		return "miniHome/diary";
	}
	
	@RequestMapping(value="/miniHome/diaryWriteView")
	public String diaryWriteView() {
		return "miniHome/diaryWrite";
	}

}
