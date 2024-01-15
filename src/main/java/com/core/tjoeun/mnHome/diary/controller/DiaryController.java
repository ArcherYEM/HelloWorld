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
	
	@RequestMapping("/mnHome/diaryView/{userNickname}")
	public String diaryView(@PathVariable String userNickname, Model model) {
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("userNickname", userMap.get("userNickname"));
		model.addAttribute("title", userMap.get("title"));
		
		
		
		Map diary = diaryService.selectDiary(userMap);
	    model.addAttribute("diary", diary);
	    if(diary == null) {
	    	model.addAttribute("nullCheck",true);
	    }else if(diary != null) {
	    	model.addAttribute("nullCheck",false);
	    }
	    List<HashMap> cmtList = diaryService.selectDiaryCMT(userNickname);
	    
	 // 일기별로 댓글을 저장할 맵
	    Map<String, List<HashMap>> diaryCmt = new HashMap<>();

	    // 결과 반복 처리
	    for (HashMap<String, Object> cmt : cmtList) {
	        String diarySeq = cmt.get("diarySeq").toString();
	        
	        // 맵에 해당 일기의 댓글 리스트가 이미 존재하는지 확인
	        if (diaryCmt.containsKey(diarySeq)) {
	            // 이미 존재한다면 리스트에 댓글 추가
	        	diaryCmt.get(diarySeq).add(cmt);
	        } else {
	            // 존재하지 않는다면 새로운 리스트를 만들어서 댓글 추가 후 맵에 추가
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
        System.out.println("### callMenu : " + callMenu);
        
        try {
        	Map mainMenu = mainService.mainMenu(callMenu);
        	System.out.println("### mainMenu : " + mainMenu);
        	
        	model.addAttribute("menuProductName", mainMenu.get("productName"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));
	        System.out.println("### menu model : " + model);
	        
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "miniHome/diary";
	}
	
	@RequestMapping(value="/mnHome/diaryWriteView/{userNickname}")
	public String diaryWriteView(@PathVariable String userNickname, Model model, Map map) {
		
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("title", userMap.get("title"));
		
		// menu color 적용하기
        Map callMenu = new HashMap();
        callMenu.put("category", "menu");
        callMenu.put("userNickname", userNickname);
        System.out.println("### callMenu : " + callMenu);
        
        try {
        	Map mainMenu = mainService.mainMenu(callMenu);
        	System.out.println("### mainMenu : " + mainMenu);
        	
        	model.addAttribute("menuProductName", mainMenu.get("productName"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));
	        System.out.println("### menu model : " + model);
	        
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		return "miniHome/diaryWrite";
	}
	
	@RequestMapping(value="/mnHome/diaryAdd", method = RequestMethod.POST)
	@ResponseBody
	public Map diaryAdd(@RequestBody  Map map) throws Exception {
			
			map.put("openScope",1);
			Map resultMap = diaryService.insertDiary(map);
			if(resultMap != null) {
				resultMap.put("resultCode", "1");
				return resultMap;
			} else {
				resultMap.put("resultCode", "0");
				return resultMap;
			}
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
}
