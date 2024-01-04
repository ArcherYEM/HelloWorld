package com.core.tjoeun.mnHome.visit.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.tjoeun.mnHome.main.service.MainService;

@Controller
public class VisitController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping(value="/mnHome/visitView/{userNickname}")
	public String visitView(@PathVariable String userNickname, Model model) {
		//프로필 정보 가져오기
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
				
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		return "miniHome/visit";
	}
	
}
