package com.core.tjoeun.mnHome.visit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.mnHome.main.service.MainService;
import com.core.tjoeun.mnHome.visit.service.VisitService;

@Controller
public class VisitController {
	
	@Autowired
	MainService mainService;
	
	@Autowired
	VisitService visitService;
	
	@RequestMapping(value="/mnHome/visitView/{userNickname}")
	public String visitView(@PathVariable String userNickname, Model model) {
		//프로필 정보 가져오기
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
				
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		//방명록 내용 가져오기
		List<Map> resultList = visitService.selectVisitComment(userNickname);
		System.out.println("테스트"+resultList);
		model.addAttribute("visit",resultList);
		
		return "miniHome/visit";
	}
	
	@RequestMapping(value = "/mnHome/visitComment")
	@ResponseBody
	public Map visitComment(@RequestBody Map map) {
		
		int result = visitService.insertVisitComment(map);
		String returnResult;
		Map resultMap = new HashMap();
		if(result == 1) {
			returnResult = "Success";
		}
		else {
			returnResult = "Fail";
		}
		resultMap.put("result",returnResult);
		return resultMap;
	}
	
	@RequestMapping(value = "/mnHome/visitCommentUpdate")
	@ResponseBody
	public Map visitCommentUpdate(@RequestBody Map map) {
		
		int result = visitService.updateVisitComment(map);
		
		String returnResult;
		Map resultMap = new HashMap();
		if(result == 1) {
			returnResult = "Success";
		}
		else {
			returnResult = "Fail";
		}
		resultMap.put("result",returnResult);
		return resultMap;
	}
	
	@RequestMapping(value = "/mnHome/visitCommentDelete")
	@ResponseBody
	public Map visitCommentDelete(@RequestBody Map map) {
		
		int result = visitService.deleteVisitComment(map);
		
		System.out.println("테스트"+result);
		
		String returnResult;
		Map resultMap = new HashMap();
		if(result == 1) {
			returnResult = "Success";
		}
		else {
			returnResult = "Fail";
		}
		resultMap.put("result",returnResult);
		return resultMap;
	}
}
