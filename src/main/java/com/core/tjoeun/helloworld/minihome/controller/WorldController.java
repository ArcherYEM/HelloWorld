package com.core.tjoeun.helloworld.minihome.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.core.tjoeun.helloworld.minihome.service.WorldService;

@Controller
public class WorldController {
	
	@Autowired
	WorldService worldService;
	
	@RequestMapping("/helloworld/minihome/main")
	public String minihome() {
		
		return "minihome/main";
	}

	
}
