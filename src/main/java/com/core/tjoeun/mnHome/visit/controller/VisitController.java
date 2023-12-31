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
import org.springframework.web.bind.annotation.RequestParam;
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
	public String visitView(@PathVariable String userNickname, Model model, @RequestParam(required = false) Integer page) {
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
		if(page == null) {
			page = 1;
		}
		int totalCnt = visitService.selectCnt(userNickname);
		int totalPage = totalCnt/5;
		if(0 < totalCnt % 5) {
			totalPage++;
		}
		int offset = (page-1)*5;
		
		Map paramMap = new HashMap();
		paramMap.put("offset", offset);
		paramMap.put("targetNickname", userNickname);
		
		List<Map> resultList = visitService.selectVisitComment(paramMap);
		for(int i = 0; i < resultList.size(); i++) {
			Map map2 = resultList.get(i);
			map2.put("number", ((page-1)*5+(i+1)));
		}
		
		System.out.println("테스트"+resultList);
		System.out.println("토탈페이지"+totalPage);
		model.addAttribute("visit",resultList);
		model.addAttribute("totalPage",totalPage);
		
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