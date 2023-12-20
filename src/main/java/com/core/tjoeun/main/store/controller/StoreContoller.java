package com.core.tjoeun.main.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreContoller {

	@RequestMapping(value = "/store/minimiView")
	public String minimi() {
		
		return "store/minimi";
	}
	
	@RequestMapping(value = "/store/skinView")
	public String skin() {
		
		return "/store/skin";
	}
	
	@RequestMapping(value = "/store/menuView")
	public String menu() {
		
		return "/store/menu";
	}
	
	@RequestMapping(value = "/store/dotoriView")
	public String dotori() {
		
		return "/store/dotori";
	}

	@RequestMapping(value = "/store/bgmView")
	public String bgm() {
		
		return "/store/dotori";
	}
	
}
