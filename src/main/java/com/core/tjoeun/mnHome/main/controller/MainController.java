package com.core.tjoeun.mnHome.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/miniHome/main")
	public String mainHome() {
		
		return "miniHome/main";
	}
}

