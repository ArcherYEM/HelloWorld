package com.core.tjoeun.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreContoller {

	@RequestMapping("/store/minimiView")
	public String afterFindPw() {
		
		return "store/minimi";
	}
	
}
