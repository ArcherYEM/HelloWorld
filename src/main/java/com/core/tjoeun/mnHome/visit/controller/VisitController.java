package com.core.tjoeun.mnHome.visit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VisitController {
	
	@RequestMapping(value="/mnHome/visitView")
	public String visitView() {
		
		return "miniHome/visit";
	}
	
}
