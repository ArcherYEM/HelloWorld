package com.core.tjoeun.mnHome.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping(value="/miniHome/board")
	public String boardView() {
		
		return "miniHome/board";
	}
	
	@RequestMapping(value="/miniHome/boardWriteView")
	public String boardWriteView() {
		
		return "miniHome/boardWrite";
	}
	
	@RequestMapping(value="/miniHome/boardDetail")
	public String boardDetail() {
		
		return "miniHome/boardDetail";
	}
}
