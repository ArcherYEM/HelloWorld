package com.core.tjoeun.mnHome.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.core.tjoeun.mnHome.main.service.MainService;


@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@Value("${default.image.path}")
    private String defaultImagePath;
	
	@Value("${default.minimi.path}")
    private String defaultMinimi;
	
	@Value("${default.background.path}")
    private String defaultBackground;
	
	@RequestMapping("/mnHome/mainView")
	public String minihome(Model model, @RequestParam Map map, HttpServletRequest req , HttpSession session) {
		
		if(session == null || session.getAttribute("userId") == null) {
			model.addAttribute("loginStatus",false);
			model.addAttribute("image",defaultImagePath);
			
			// 배경에 대한 기본 설정을 Map에 담아 모델에 추가합니다.
	        Map background = new HashMap();
	        background.put("backgroundPath", defaultBackground);
	        model.addAttribute("background",background);
	        
	        // 미니미(아바타)에 대한 기본 설정을 Map에 담아 모델에 추가합니다.
	        Map<String, Object> minimiList = new HashMap<>();
	        minimiList.put("minimiPath",defaultMinimi);
	        minimiList.put("minimiLeft", "390");
	        minimiList.put("minimiTop", "163");
	        model.addAttribute("minimiList", minimiList);
			
	        System.out.println(background);
	        System.out.println(minimiList);
	        
            return "miniHome/main";
        }
		model.addAttribute("loginStatus",true);
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");
		
		mainService.getProfile(userNickname);
		String image = (String) mainService.getProfile(userNickname).get("image");
		String msg = (String) mainService.getProfile(userNickname).get("msg");
		msg = msg.replace("\n", "<br>");
		
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		session.setAttribute("userId", userMap);
		
		List<Map> minimiList = mainService.selectMinimi(userNickname);
        model.addAttribute("minimiList", minimiList);
        
        Map background = mainService.selectBackground(userNickname);
        model.addAttribute("background", background);
        
		return "miniHome/main";
	}
	
	@RequestMapping("/mnHome/mnhProfileEditView")
	public String mnhProfileEdit() {
		
		return "miniHome/mnhProfileEdit";
	}
	
	@RequestMapping("/mnHome/miniroomSave")
	public String miniroomSave(@RequestParam("backgroundName") String backgroundName,
            @RequestParam Map<String, String> allParams,
            HttpServletRequest req , HttpSession session) {
		
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");
		
		mainService.resetBackground(userNickname);
		
		Map<String, Object> params = new HashMap<>();
	    params.put("userNickname", userNickname);
	    params.put("backgroundName", backgroundName);
	    params.put("backgroundPath", "/resources/images/miniroom/"+backgroundName+".png");
		mainService.upsertBackground(params);    
	    
		mainService.resetMinimi(userNickname);
		
		List<Map<String,Object>> minimiList = new ArrayList<>();
		
		for(int i = 0; allParams.containsKey("minimiName" + i); i++) {			
			Map<String, Object> minimiData = new HashMap<>();
			minimiData.put("userNickname",userNickname);
            minimiData.put("minimiName", allParams.get("minimiName" + i));
            minimiData.put("minimiPath", "/resources/images/minimi/"+allParams.get("minimiName" + i)+".gif");
            minimiData.put("minimiLeft", allParams.get("minimiLeft" + i));
            minimiData.put("minimiTop", allParams.get("minimiTop" + i));
            
            minimiList.add(minimiData);
            mainService.insertMinimi(minimiData);
		}
		
		return "miniHome/miniroomSave";
	}
	
	@RequestMapping("/mnHome/miniroomHistoryView")
	public String mnhProfileHistory(HttpSession session, HttpServletRequest req, Model model) {
		
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		if(userMap==null) {
			model.addAttribute("loginStatus",false);
			return "miniHome/mnhProfileHistory";
		} else {
			model.addAttribute("loginStatus",true);
		}
		
		String userNickname = (String) userMap.get("userNickname");
		
		List<Map> profileHistory = mainService.getProfileHistory(userNickname);
		for(Map history : profileHistory) {
		    String msg = (String) history.get("msg");
		    if(msg != null) {
		        msg = msg.replace("\n", "<br>");
		        history.put("msg", msg);
		    }
		}
		if(profileHistory==null||profileHistory.isEmpty()) {
			model.addAttribute("historyMessage", "히스토리가 존재하지 않습니다.");			
		}		

		model.addAttribute("profileHistory", profileHistory);
		session.setAttribute("userId", userMap);
		
		return "miniHome/mnhProfileHistory";
	}
	
	@RequestMapping("/mnHome/miniroomEditView")
	public String miniroomEdit(HttpServletRequest req, HttpSession session, Model model) {
		
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");
		
		List<Map> minimi = mainService.getMinimi(userNickname);
		model.addAttribute("minimi",minimi);
		
		return "miniHome/miniroomEdit";
	}
	
	@RequestMapping("/mnHome/diaryView")
	public String diary() {
		
		return "miniHome/diary";
	}
	
	@RequestMapping(value="/mnHome/diaryWriteView")
	public String diaryWriteView() {
		return "miniHome/diaryWrite";
	}
	
	@RequestMapping("/mnHome/albumView")
	public String album() {
		
		return "miniHome/album";
	}
	
   @RequestMapping(value="/mnHome/albumWriteView")
   public String albumWriteView() {
      return "miniHome/albumWrite";
   }

	
	@RequestMapping("/mnHome/boardView")
	public String board() {
		
		return "miniHome/board";
	}
	
	@RequestMapping(value="/mnHome/boardWriteView")
	   public String boardWriteView() {
	      return "miniHome/boardWrite";
	   }
	
	@RequestMapping("/mnHome/visitView")
	public String visit() {
		
		return "miniHome/visit";
	}
	
	@RequestMapping("/mnHome/settingView")
	public String setting() {
		
		return "miniHome/setting";
	}
	
}
