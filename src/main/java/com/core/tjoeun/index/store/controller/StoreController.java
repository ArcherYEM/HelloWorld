package com.core.tjoeun.index.store.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.index.store.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	StoreService storeService;
	
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
	public String getBgmList(Model model, @RequestParam Map map) {
		try {
			List<Map> bgm = storeService.getBgmList(map);
			model.addAttribute("bgmInfo",bgm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/store/bgm";
	}
	
}
