package com.core.tjoeun.mnHome.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.core.tjoeun.mnHome.main.service.WorldService;


@Controller
public class WorldController {
	
	@Autowired
	WorldService worldService;
	
	@RequestMapping("/helloworld/minihome/main")
	public String minihome() {
		
		return "minihome/main";
	}
	
	/* favicon 에러 처리 */
	@RequestMapping("/favicon.ico")
    public void favicon() {
    }

}
