package com.core.tjoeun.mnHome.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.tjoeun.mnHome.main.service.MainService;


@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/mnHome/mainView")
	public String minihome() {
		
		return "miniHome/main";
	}
	@RequestMapping("/mnHome/albumView")
	public String album() {
		
		return "miniHome/album";
	}
	@RequestMapping("/mnHome/visitView")
	public String visit() {
		
		return "miniHome/visit";
	}
	@RequestMapping("/mnHome/settingView")
	public String setting() {
		
		return "miniHome/setting";
	}
	@RequestMapping("/mnHome/boardView")
	public String board() {
		
		return "miniHome/board";
	}
	@RequestMapping("/mnHome/diaryView")
	public String diaryView() {
		
		return "miniHome/diary";
	}
}
