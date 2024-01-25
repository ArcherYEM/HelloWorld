package com.core.tjoeun.mnHome.diary.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.diary.service.DiaryService;
import com.core.tjoeun.mnHome.main.dao.MainDao;
import com.core.tjoeun.mnHome.main.service.MainService;

@Controller
public class DiaryController {
	
	@Autowired
	MainService mainService;

	@Autowired
	DiaryService diaryService;
	
	@Autowired
	MainDao mainDao;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/mnHome/diaryView/{userNickname}")
	public String diaryView(@PathVariable String userNickname, Model model) {
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("userNickname", userMap.get("userNickname"));
		model.addAttribute("title", userMap.get("title"));
		
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		
		List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);
		
        
		Map diary = diaryService.selectDiary(userMap);
	    model.addAttribute("diary", diary);
//	    if(diary == null) {
//	    	model.addAttribute("nullCheck",true);
//	    }else if(diary != null) {
//	    	model.addAttribute("nullCheck",false);
//	    }
	    List<HashMap> cmtList = diaryService.selectDiaryCMT(userNickname);
	    
	 // 일기별로 댓글을 저장할 맵
	    Map<String, List<HashMap>> diaryCmt = new HashMap<>();

	    // 결과 반복 처리
	    for (HashMap<String, Object> cmt : cmtList) {
	        String diarySeq = cmt.get("diarySeq").toString();
	        
	        if (diaryCmt.containsKey(diarySeq)) {
	        	diaryCmt.get(diarySeq).add(cmt);
	        } else {
	            List<HashMap> newCMTList = new ArrayList<>();
	            newCMTList.add(cmt);
	            diaryCmt.put(diarySeq, newCMTList);
	        }
	    }
	    model.addAttribute("cmtList", diaryCmt);
		
		// menu color 적용하기
        Map callMenu = new HashMap();
        callMenu.put("category", "menu");
        callMenu.put("userNickname", userNickname);
        
        try {
        	Map mainMenu = mainService.mainMenu(callMenu);
        	
        	model.addAttribute("menuProductName", mainMenu.get("productName"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));
	        
        } catch (NullPointerException n) {
	        	model.addAttribute("menuProductName", "rgb(42, 140, 168)");
	        	model.addAttribute("menuCategory", "menu");
	        	n.printStackTrace();
        }
        
      //방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "miniHome/diary";
	}
	
	@RequestMapping(value="/mnHome/diaryWriteView/{userNickname}")
	public String diaryWriteView(@PathVariable String userNickname, Model model, Map map) {
		
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("title", userMap.get("title"));
		
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		
		List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);
		
		// menu color 적용하기
        Map callMenu = new HashMap();
        callMenu.put("category", "menu");
        callMenu.put("userNickname", userNickname);
        
        try {
        	Map mainMenu = mainService.mainMenu(callMenu);
        	
        	model.addAttribute("menuProductName", mainMenu.get("productName"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));
	        
        } catch (NullPointerException n) {
	        	model.addAttribute("menuProductName", "rgb(42, 140, 168)");
	        	model.addAttribute("menuCategory", "menu");
	        	n.printStackTrace();
        }
		
      //방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "miniHome/diaryWrite";
	}
	
	@RequestMapping(value="/mnHome/diaryModifyView/{userNickname}/{seq}")
	public String diaryModifyView(@PathVariable String userNickname
								, @PathVariable String seq, Model model, Map map) {
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("title", userMap.get("title"));
		
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		
		List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);
		
		// menu color 적용하기
        Map callMenu = new HashMap();
        callMenu.put("category", "menu");
        callMenu.put("userNickname", userNickname);
        
        try {
        	Map mainMenu = mainService.mainMenu(callMenu);
        	
        	model.addAttribute("menuProductName", mainMenu.get("productName"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));
	        
        } catch (NullPointerException n) {
	        	model.addAttribute("menuProductName", "rgb(42, 140, 168)");
	        	model.addAttribute("menuCategory", "menu");
	        	n.printStackTrace();
        }
		
      //방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        Map oneMap = new HashMap();
        oneMap.put("seq",seq);
        model.addAttribute("diary", diaryService.selectOne(oneMap));
        
		return "miniHome/diaryModify";
	}
	
	@RequestMapping(value="/mnHome/diaryAdd", method = RequestMethod.POST)
	@ResponseBody
	public Map diaryAdd(@RequestBody  Map map) throws Exception {
			
			Map tempMap = new HashMap();
			tempMap.put("userNickname", map.get("userNickname"));
			tempMap.put("date", map.get("diary_date"));
			
			Map resultMap = new HashMap();
					
			Map checkMap = diaryService.diaryTest(tempMap);
			if(checkMap == null) {
				try {
					diaryService.insertDiary(map);
					resultMap.put("resultCode", "1");
				} catch (Exception e) {
					e.printStackTrace();
					resultMap.put("resultCode", "0");
				}
			}else {
				resultMap.put("resultCode", "-1");
			}
			
			return resultMap;
	}
	
	@RequestMapping(value="/mnHome/diaryAddCMT", method = RequestMethod.POST)
	@ResponseBody
	public Map diaryAddCMT(@RequestBody  Map map) throws Exception {
			map.put("openScope",1);
			
			Map resultMap = new HashMap();
			try {
				diaryService.insertDiaryCMT(map);
				resultMap.put("resultCode", "1");
			} catch (Exception e) {
				resultMap.put("resultCode", "0");
			}
			return resultMap;
	}
	
	@RequestMapping(value="/mnHome/diaryTest", method = RequestMethod.POST)
	@ResponseBody
	public Map diaryTest(@RequestBody Map paramMap){
		Map jsonMap = new HashMap();
		Map resultMap = diaryService.diaryTest(paramMap);
		
		if(resultMap != null) {
			jsonMap.put("formatted_update_date", resultMap.get("formatted_update_date"));
			jsonMap.put("title", resultMap.get("title"));
			jsonMap.put("content", resultMap.get("content"));
			jsonMap.put("seq", resultMap.get("seq"));
			jsonMap.put("openScope", resultMap.get("openScope"));
			
			int seq = (int) resultMap.get("seq");
			List<HashMap> cmtList = diaryService.diaryCmtTest(String.valueOf(seq));
			jsonMap.put("cmt", cmtList);
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/mnHome/getDiaryCmt", method = RequestMethod.POST)
	@ResponseBody
	public Map getDiaryCmt(@RequestBody Map paramMap){
		Map jsonMap = new HashMap();
		
		if(paramMap != null) {
			int seq = (int) paramMap.get("seq");
			
			List<HashMap> cmtList = diaryService.diaryCmtTest(String.valueOf(seq));
			jsonMap.put("cmt", cmtList);
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/mnHome/diaryModify", method = RequestMethod.POST)
	@ResponseBody
	public Map diaryModify(@RequestBody Map paramMap){
		Map jsonMap = new HashMap();
		
		try {
			diaryService.modifyDiary(paramMap);
			jsonMap.put("resultCode", "1");
		} catch (Exception e) {
			e.printStackTrace();
			jsonMap.put("resultCode", "0");
			
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/mnHome/diaryDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map diaryDelete(@RequestBody Map paramMap){
		Map jsonMap = new HashMap();
		
		try {
			diaryService.deleteDiary(paramMap);
			jsonMap.put("resultCode", "1");
		} catch (Exception e) {
			e.printStackTrace();
			jsonMap.put("resultCode", "0");
			
		}
		
		return jsonMap;
	}
}
