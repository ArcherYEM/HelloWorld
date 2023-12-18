package com.core.tjoeun.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
	@RequestMapping(value="/notice/noticeView", method = RequestMethod.GET)
	public String findPw() {
		
		return "notice/notice";
	}
	
	@RequestMapping(value="/notice/noticeWrite", method = RequestMethod.GET)
	public String noticeWrite() {
		
		return "notice/noticeWrite";
	}
	

}
