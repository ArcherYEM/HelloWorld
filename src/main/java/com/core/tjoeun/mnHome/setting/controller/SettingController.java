package com.core.tjoeun.mnHome.setting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingController {
	
	@RequestMapping(value="/miniHome/setting")
	public String settingView() {
		
		return "miniHome/setting";
	}
	
	@RequestMapping(value="/miniHome/settingBgm")
	public String settingBgmView() {
		
		return "miniHome/settingBgm";
	}
	
	@RequestMapping(value="/miniHome/settingMenu")
	public String settingMenuView() {
		
		return "miniHome/settingMenu";
	}
	
	@RequestMapping(value="/miniHome/settingSkin")
	public String settingSkinView() {
		
		return "miniHome/settingSkin";
	}
	
	@RequestMapping(value="/miniHome/settingDotoriUse")
	public String settingDotoriUseView() {
		
		return "miniHome/settingDotoriUse";
	}
	
	@RequestMapping(value="/miniHome/settingDotoriCharge")
	public String settingDotoriChargeView() {
		
		return "miniHome/settingDotoriCharge";
	}
	
	@RequestMapping(value="/miniHome/settingFriends")
	public String settingFriendsView() {
		
		return "miniHome/settingFriends";
	}
	

	@RequestMapping("/mnHome/mnhMinimiChange")
	public String mnhProfileEdit() {
		
		return "miniHome/mnhMinimiChange";
	}
}
