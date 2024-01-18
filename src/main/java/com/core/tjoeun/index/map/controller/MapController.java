package com.core.tjoeun.index.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {
	
	@RequestMapping(value = "index/mapView", method = RequestMethod.GET)
	public String mapView() {
		
		return "index/map";
	}
}
