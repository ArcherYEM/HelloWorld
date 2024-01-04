package com.core.tjoeun.mnHome.album.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.main.service.MainService;

@Controller
public class AlbumController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MainService mainService;
	
//	@RequestMapping(value="/mnHome/albumView")
//	public String albumView() {
//		
//		return "miniHome/album";
//	}
//	
//	@RequestMapping(value="/mnHome/albumWriteView")
//	public String albumWriteView() {
//		
//		return "miniHome/albumWrite";
//	}
	
	@RequestMapping(value="/mnHome/albumView/{userNickname}")
	public String albumView(@PathVariable String userNickname, Model model) {
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		return "miniHome/album";
	}
	
	@RequestMapping(value="/mnHome/albumWriteView/{userNickname}")
	public String albumWriteView(@PathVariable String userNickname, Model model) {
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		return "miniHome/albumWrite";
	}
}

