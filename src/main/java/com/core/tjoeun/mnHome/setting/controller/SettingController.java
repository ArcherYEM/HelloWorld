package com.core.tjoeun.mnHome.setting.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.tjoeun.mnHome.setting.service.SettingService;

@Controller
public class SettingController {

	@Autowired
	SettingService settingService;

	@RequestMapping(value = "/miniHome/setting")
	public String settingView() {

		return "miniHome/setting";
	}

	@RequestMapping(value = "/miniHome/settingBgm")
	public String settingBgmView() {

		return "miniHome/settingBgm";
	}

	@RequestMapping(value = "/miniHome/settingMenu")
	public String settingMenuView() {

		return "miniHome/settingMenu";
	}

	@RequestMapping(value = "/miniHome/settingSkin")
	public String settingSkinView() {

		return "miniHome/settingSkin";
	}

	@RequestMapping(value = "/miniHome/settingDotoriUse")
	public String settingDotoriUseView() {

		return "miniHome/settingDotoriUse";
	}

	@RequestMapping(value = "/miniHome/settingDotoriCharge")
	public String settingDotoriChargeView() {

		return "miniHome/settingDotoriCharge";
	}

	@RequestMapping(value = "/miniHome/settingFriends")
	public String settingFriendsView() {

		return "miniHome/settingFriends";
	}

	@RequestMapping("/mnHome/mnhMinimiChangeView")
	public String selectSettingUserStorage(HttpSession session, Model model) {
		String userNickname = (String) session.getAttribute("userNickname");
		try {
			if (userNickname != null) {
				Map<String, Object> paramMap = new HashMap<>();
	            paramMap.put("userNickname", userNickname);
	            
	            String contentPath = settingService.getContentPath(paramMap);
	            
	            model.addAttribute("contentPath", contentPath);
	            
	            System.out.println("userNickname : " + userNickname + " / contentPath : " + contentPath);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "miniHome/mnhMinimiChange";
	}

}
