package com.core.tjoeun.mnHome.visit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VisitController {
	
	@RequestMapping(value="/miniHome/visit")
	public String visitView() {
		
		return "miniHome/visit";
	}
}
