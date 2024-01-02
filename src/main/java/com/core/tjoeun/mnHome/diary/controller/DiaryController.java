package com.core.tjoeun.mnHome.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DiaryController {
			
	@RequestMapping("/mnHome/diaryView")
	public String diary() {
		
		return "miniHome/diary";
	}
	
	@RequestMapping(value="/mnHome/diaryWriteView")
	public String diaryWriteView() {
		return "miniHome/diaryWrite";
	}

}
