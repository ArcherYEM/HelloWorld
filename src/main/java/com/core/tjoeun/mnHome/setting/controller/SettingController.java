package com.core.tjoeun.mnHome.setting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingController {
	
	@RequestMapping(value="/miniHome/setting")
	public String settingView() {
		
		return "miniHome/setting";
	}
}
