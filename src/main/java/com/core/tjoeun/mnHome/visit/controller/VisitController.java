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

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.main.dao.MainDao;
import com.core.tjoeun.mnHome.main.service.MainService;
import com.core.tjoeun.mnHome.visit.service.VisitService;

@Controller
public class VisitController {
	
	@Autowired
	MainService mainService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	VisitService visitService;
	
	@Autowired
	MainDao mainDao;
	
	@RequestMapping(value = "/mnHome/visitView/{userNickname}")
	public String visitView(@PathVariable String userNickname, Model model, @RequestParam(required = false) Integer page) {


	    // 프로필 정보 가져오기
	    Map profile = mainService.getProfile(userNickname);
	    String image = (String) profile.get("image");
	    String msg = (String) profile.get("msg");
	    msg = msg.replace("\n", "<br>");
	    model.addAttribute("image", image);
	    model.addAttribute("msg", msg);

	    
	  //미니홈피 주인 정보 가져오기 (이름,성별,제목)
	  	Map userInfo = mainService.selectUserInfo(userNickname);
	  	model.addAttribute("userName", userInfo.get("userName"));		
	  	model.addAttribute("userGender",userInfo.get("userGender"));
	  	String title = (String) userInfo.get("title");
	  	model.addAttribute("title", title);

	    // 방명록 내용 가져오기
	    if (page == null) {
	        page = 1;
	    }
	    int totalCnt = visitService.selectCnt(userNickname);
	    int totalPage = totalCnt / 5;
	    if (0 < totalCnt % 5) {
	        totalPage++;
	    }
	    int offset = (page - 1) * 5;

	    Map paramMap = new HashMap();
	    paramMap.put("offset", offset);
	    paramMap.put("targetNickname", userNickname);

	    List<Map> resultList = visitService.selectVisitComment(paramMap);

	    for (int i = 0; i < resultList.size(); i++) {
	        Map map2 = resultList.get(i);
	        map2.put("number", ((page - 1) * 5 + (i + 1)));

	        String content = (String) map2.get("content");
	        content = content.replace("\n", "<br>");
	        map2.put("content", content);
	    }

	    model.addAttribute("visit", resultList);
	    model.addAttribute("totalPage", totalPage);

	    // 접속중인 유저의 친구 전부 가져오기
	    List<Map> friendMap = mainService.getMyFriends(userNickname);
	    model.addAttribute("friend", friendMap);

	    // menu color 적용하기
	    Map callMenu = new HashMap();
	    callMenu.put("category", "menu");
	    callMenu.put("userNickname", userNickname);

	    try {
	        Map mainMenu = mainService.mainMenu(callMenu);

	        model.addAttribute("menuContentPath", mainMenu.get("contentPath"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));

	    } catch (NullPointerException n) {
	        model.addAttribute("menuContentPath", "rgb(42, 140, 168)");
	        model.addAttribute("menuCategory", "menu");
	        n.printStackTrace();
	    }

	    // 방문자 수 가져오기
	    try {
	        Map visitCntMap = new HashMap();
	        visitCntMap = mainDao.selectVisitCnt(userNickname);
	        model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
	        model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

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