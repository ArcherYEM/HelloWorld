package com.core.tjoeun.mnHome.main.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.core.tjoeun.mnHome.main.service.MainService;


@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/mnHome/mainView")
	public String minihome(@RequestParam Map map, HttpServletRequest req , HttpSession session) {
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		
		session.setAttribute("userId", userMap);
		return "miniHome/main";
	}
	
	@RequestMapping("/mnHome/mnhProfileEditView")
	public String mnhProfileEdit() {
		
		return "miniHome/mnhProfileEdit";
	}
	
	@RequestMapping("/mnHome/miniroomEditView")
	public String miniroomEdit() {
		
		return "miniHome/miniroomEdit";
	}
	
	@RequestMapping("/mnHome/diaryView")
	public String diary() {
		
		return "miniHome/diary";
	}
	
	@RequestMapping("/mnHome/albumView")
	public String album() {
		
		return "miniHome/album";
	}
	
	@RequestMapping("/mnHome/boardView")
	public String board() {
		
		return "miniHome/board";
	}
	
	@RequestMapping("/mnHome/visitView")
	public String visit() {
		
		return "miniHome/visit";
	}
	
	@RequestMapping("/mnHome/settingView")
	public String setting() {
		
		return "miniHome/setting";
	}
	
}
