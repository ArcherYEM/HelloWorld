package com.core.tjoeun.mnHome.album.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlbumController {
	
	@RequestMapping(value="/mnHome/albumView")
	public String albumView() {
		
		return "miniHome/album";
	}
	
	@RequestMapping(value="/mnHome/albumWriteView")
	public String albumWriteView() {
		
		return "miniHome/albumWrite";
	}
}

