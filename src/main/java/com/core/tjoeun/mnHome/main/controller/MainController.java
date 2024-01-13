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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.main.service.MainService;


@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@Autowired
	MemberService memberService;
	
	@Value("${default.image.path}")
    private String defaultImagePath;
	
	@Value("${default.minimi.path}")
    private String defaultMinimi;
	
	@Value("${default.background.path}")
    private String defaultBackground;
	
//	//메인 홈 (프로필 사진, 프로필 메시지, 미니룸 불러옴)
//	@RequestMapping("/mnHome/mainView")
//	public String minihome(Model model, @RequestParam Map map, HttpServletRequest req , HttpSession session) {
//		
//		if(session == null || session.getAttribute("userId") == null) {
//			model.addAttribute("loginStatus",false);
//			model.addAttribute("image",defaultImagePath);
//			
//			// 배경에 대한 기본 설정을 Map에 담아 모델에 추가합니다.
//	        Map background = new HashMap();
//	        background.put("backgroundPath", defaultBackground);
//	        model.addAttribute("background",background);
//	        
//	        // 미니미에 대한 기본 설정을 Map에 담아 모델에 추가합니다.
//	        Map<String, Object> minimiList = new HashMap<>();
//	        minimiList.put("minimiPath",defaultMinimi);
//	        minimiList.put("minimiLeft", "390");
//	        minimiList.put("minimiTop", "163");
//	        model.addAttribute("minimiList", minimiList);
//	
//            return "miniHome/main";
//        }
//		model.addAttribute("loginStatus",true);
//		//세션을 이용하여 현재 접속해있는 유저의 정보를 가져옵니다.
//		Map userMap = new HashMap();
//		session = req.getSession();
//		userMap = (Map) session.getAttribute("userId");
//		String userNickname = (String) userMap.get("userNickname");
//		String userName = (String) userMap.get("userName");
//		
//		Map profile = mainService.getProfile(userNickname);
//		String image = (String) profile.get("image");
//		String msg = (String) profile.get("msg");
//		msg = msg.replace("\n", "<br>");
//		System.out.println("### profile : " + profile);
//		
//		model.addAttribute("image", image);
//		model.addAttribute("msg", msg);
//		session.setAttribute("userId", userMap);
//		
//		//홈피 주인 이름 가져오기 
//		//String userName = memberService.getUserName(userNickname);
//		model.addAttribute("userName", userName);
//		model.addAttribute("userNickname", userNickname);
//		
//		Map title = mainService.getHomeTitle(userNickname);
//		if(title != null) {
//			model.addAttribute("title", title.get("title"));
//		}else {
//			model.addAttribute("title", userName + "의 미니홈피입니다.");
//		}
//		System.out.println("### title : " + title);
//		
//		List<Map> minimiList = mainService.selectMinimi(userNickname);
//        model.addAttribute("minimiList", minimiList);
//        
//		return "miniHome/main";
//	}
	
	@RequestMapping("/mnHome/mainView/{userNickname}")
	public String mainView(@PathVariable String userNickname, Model model) {
	    
		//프로필 정보 가져오기
		Map profile = mainService.getProfile(userNickname);
		if(null == profile) {
			return "/home";
		}
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		
		//홈피 주인 성별 가져오기
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		//홈피 주인 이름 가져오기 
		String userName = memberService.getUserName(userNickname);
		model.addAttribute("userName", userName);
		
		//Home Title
		Map title = mainService.getHomeTitle(userNickname);
		if(title != null) {
			model.addAttribute("title", title.get("title"));
		}else {
			model.addAttribute("title", userName + "의 미니홈피입니다.");
		}
		
		//miniroom
		List<Map> minimiList = mainService.selectMinimi(userNickname);
        model.addAttribute("minimiList", minimiList);
        
        Map background = mainService.selectBackground(userNickname);
        model.addAttribute("background", background);
		
        //다이어리, 앨범, 게시판, 방명록 전체 개수 가져오기
        Map countMap = mainService.selectAllTab(userNickname);
        model.addAttribute("count",countMap);
        
        //다이어리, 앨범, 게시판, 방명록 최근 24개 개수 가져오기
        Map newMap = mainService.selectNewTab(userNickname);
        model.addAttribute("newCount",newMap);
        
        //접속중인 유저의 친구 전부 가져오기
        List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);
        
     // background color 적용하기
        Map callSkin = new HashMap();
        callSkin.put("category", "skin");
        callSkin.put("userNickname", userNickname);
        System.out.println("### userNickname : " + userNickname);
        System.out.println("### callSkin : " + callSkin);
        
        try {
	        Map mainSkin = mainService.mainSkin(callSkin);
	        System.out.println("### mainSkin : " + mainSkin);
        
	        model.addAttribute("bgProductName", mainSkin.get("productName"));
	        model.addAttribute("bgCategory", mainSkin.get("category"));
	        model.addAttribute("bgUserNickname", mainSkin.get("userNickname"));
	        System.out.println("### model : " + model);
	        
        } catch (NullPointerException n) {
	        	model.addAttribute("bgProductName", "rgb(42, 140, 168)");
	        	model.addAttribute("bgCategory", "skin");
	        	n.printStackTrace();
        }
        
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
        
        //일촌평 가져오기
        List<Map> friendCmtList = new ArrayList<Map>();
        Map map = new HashMap();
        map.put("userNickname", userNickname);
        try {
        	friendCmtList = mainService.selectFriendCmt(map);
        	model.addAttribute("friendCmtList", friendCmtList);
        	System.out.println("### firendCmtList : " + friendCmtList);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        //미니홈피 방문자 수 가져오기
        try {
			Map updateVisitCntMap = new HashMap();
			updateVisitCntMap =	mainService.updateVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) updateVisitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) updateVisitCntMap.get("totalCnt"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        //게시판, 사진첩 최신 게시글 상위 4개 가져오기
        List<Map> currentMap = mainService.selectCurrentContent(userNickname);
        for(Map<String, String> current : currentMap) {
            String tableName = current.get("tableName");
            String url;
            if("album".equals(tableName)) {
            	url="/mnHome/albumDetailView/"+userNickname+"/"+String.valueOf(current.get("seq"));
            	System.out.println(url);
            	current.put("url", url);
            	current.put("category", "news-category category-pic");
            	current.put("tableName", "사진첩");
            } else if("board".equals(tableName)) {
            	url="/mnHome/boardDetail/"+userNickname+"/"+String.valueOf(current.get("seq"));
            	System.out.println(url);
            	current.put("url", url);
            	current.put("category", "news-category category-post");
            	current.put("tableName", "게시판");
            }
        }
        System.out.println("!최신"+currentMap);
        model.addAttribute("current",currentMap);
        
		return "miniHome/main";
	}
	
	@RequestMapping(value="/mnHome/friendCmt", method = RequestMethod.POST)
	@ResponseBody
	public Map friendCMT(@RequestBody Map map) {
		Map friendMap = new HashMap(); 
		
		try {
			int result = mainService.insertFriendCmt(map);
			if (result == 1) {
				friendMap.put("resultCode", "1");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			friendMap.put("resultCode", "0");
		}
		return friendMap;
	}
	
	@RequestMapping("/mnHome/mnhProfileEditView")
	public String mnhProfileEdit() {
		
		return "miniHome/mnhProfileEdit";
	}
	
	//미니룸 설정에서 세팅한 배경 및 미니미 정보를 DB에 저장
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
		
		return "miniHome/miniroomEditSuccess";
	}
	
	//프로필 변경 이력(히스토리) 불러옴
	@RequestMapping("/mnHome/miniroomHistoryView")
	public String mnhProfileHistory(HttpSession session, HttpServletRequest req, Model model, @RequestParam("targetNickname") String targetNickname) {
		
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
		
		List<Map> profileHistory = mainService.getProfileHistory(targetNickname);
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
	
	//
	@RequestMapping("/mnHome/miniroomEditView")
	public String miniroomEdit(HttpServletRequest req, HttpSession session, Model model) {
		
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		
		if(session == null || session.getAttribute("userId") == null) {
			model.addAttribute("loginStatus",false);			
	        
			return "miniHome/miniroomEdit";
        }

		
		String userNickname = (String) userMap.get("userNickname");
		
		List<Map> minimi = mainService.getMinimi(userNickname);
		model.addAttribute("minimi",minimi);
		model.addAttribute("loginStatus",true);
		
		return "miniHome/miniroomEdit";
	}


	
	@RequestMapping("/mnHome/titleUpdate")
	@ResponseBody
	public Map setTitle(@RequestBody Map map) {
		Map result = new HashMap<String, String>();
		
		try {
			mainService.updateHomeTitle(map);
			result.put("msg", "성공");
			
		} catch (Exception e) {
			
			result.put("msg", "실패");
			e.printStackTrace();
			
		}
		
		return result;
	}
	
	
	
	
}
