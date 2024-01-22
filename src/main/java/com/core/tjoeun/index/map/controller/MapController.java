package com.core.tjoeun.index.map.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.core.tjoeun.index.store.service.StoreService;

@Controller
public class MapController {
	
	@Autowired
	StoreService storeService;
	
	@RequestMapping(value = "index/mapView", method = RequestMethod.GET)
	public String mapView(HttpSession session, Model model) {
		
		String userNickname = (String) session.getAttribute("userNickname");
		if (userNickname != null ) {
			int dotori = storeService.getMyDotori(userNickname);
			model.addAttribute("dotori", dotori);
			
			if(userNickname.equals("제인") || userNickname.equals("관리자")) {
				model.addAttribute("isAdmin", "1");
			}else {
				model.addAttribute("isAdmin", "0");
			}
		} else {
			model.addAttribute("dotori", "");
			model.addAttribute("isAdmin", "0");
		}
		return "index/map";
	}
}
