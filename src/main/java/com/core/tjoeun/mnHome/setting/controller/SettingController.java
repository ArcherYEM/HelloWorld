package com.core.tjoeun.mnHome.setting.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.main.service.MainService;
import com.core.tjoeun.mnHome.setting.service.SettingService;

@Controller
public class SettingController {

	@Autowired
	SettingService settingService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	MainService mainService;
	
	
	
	@RequestMapping(value = "/mnHome/settingView/{userNickname}")
	public String settingView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));

		return "miniHome/setting";
	}
	
	@RequestMapping(value = "/mnHome/settingInfoEditView/{userNickname}")
	public String settingInfoEditView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		return "miniHome/settingInfoEdit";
	}

	@RequestMapping(value = "/mnHome/settingBgm/{userNickname}")
	public String settingBgmView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));

		return "miniHome/settingBgm";
	}

	@RequestMapping(value = "/mnHome/settingMenu/{userNickname}")
	public String settingMenuView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));

		return "miniHome/settingMenu";
	}

	@RequestMapping(value = "/mnHome/settingSkin/{userNickname}")
	public String settingSkinView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));

		return "miniHome/settingSkin";
	}

	@RequestMapping(value = "/mnHome/settingDotoriUse/{userNickname}")
	public String settingDotoriUseView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));

		return "miniHome/settingDotoriUse";
	}

	@RequestMapping(value = "/mnHome/settingDotoriCharge/{userNickname}")
	public String settingDotoriChargeView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));

		return "miniHome/settingDotoriCharge";
	}
	
	@RequestMapping(value = "/mnHome/settingFriends/{userNickname}")
	public String settingFriends(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		return "miniHome/settingFriends";
	}
	
//	searchFriends , setting 공통메서드
	public Map common(Map map) {
	    Map resultMap = new HashMap();
	    System.out.println("공통메서드 실행");
	    try {
	        resultMap = settingService.getSearchUser(map);
	        resultMap.put("resultCode", "1");
	    } catch (Exception e) {
	        e.printStackTrace();
	        resultMap.put("resultCode", "0");
	    }
	    System.out.println("공통메서드 종료");
	    return resultMap;
	}
	
	@RequestMapping(value = "/miniHome/setting", method = RequestMethod.POST)
	@ResponseBody
	public Map setting(@RequestBody Map map) {
		System.out.println("setting 메서드 실행");
		Map resultMap = common(map);
		
		resultMap.put("userName", resultMap.get("name"));
	    resultMap.put("userNickname", resultMap.get("nickname"));
	    resultMap.put("userPhone", resultMap.get("phone"));
	    resultMap.put("createDate", resultMap.get("date"));
	    System.out.println("setting 메서드 종료");
	    System.out.println(resultMap);
	    return resultMap;
	}

	@RequestMapping(value = "/mnHome/searchFriends", method = RequestMethod.POST)
	@ResponseBody
	public Map searchFriends(@RequestBody Map map) {
	    return common(map);
	}
	
//	@RequestMapping(value = "/mnHome/searchFriends", method = RequestMethod.POST)
//	@ResponseBody
//	public Map searchFriends(@RequestBody Map map) {
//		Map resultMap = new HashMap();
//		try {
//			resultMap = settingService.getSearchUser(map);
//			resultMap.put("resultCode", "1");
//		} catch (Exception e) {
//			e.printStackTrace();
//			resultMap.put("resultCode", "0");
//		}
//
//		return resultMap;
//	}

	@RequestMapping("/mnHome/mnhMinimiChangeView")
	public String selectSettingUserStorage(HttpSession session, HttpServletRequest req, Model model) throws SQLException {
		Map userMap = new HashMap();
		
		userMap = (Map) session.getAttribute("userId");
	      String userNickname = (String) userMap.get("userNickname");
	      
//	    Map userNickname = (Map) session.getAttribute("userNickname");
	   System.out.println("userNickname : " +  userNickname);
	    try {
	        List<Map<String, Object>> userStorageData = settingService.selectSettingUserStorage(userNickname);

	        model.addAttribute("userStorageList", userStorageData);
	        System.out.println("userStorageData : " + userStorageData);
	    } catch (SQLException sqle) {
	        sqle.printStackTrace();
	        throw sqle;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "miniHome/mnhMinimiChange";
	}
	
	@RequestMapping(value="/mnHome/mnhMinimiChangeAction", method = RequestMethod.POST)
	public String MinimiChange(
			@RequestParam ("selectedUserStorage") String minimiName,HttpSession session, HttpServletRequest req, Model model 
			) {
		
				try {
					Map userMap = new HashMap();
					userMap = (Map) session.getAttribute("userId");
					String userNickname = (String) userMap.get("userNickname");
					
					Map minimiMap = new HashMap();
					minimiMap.put("userNickname",userNickname);
					minimiMap.put("productName",minimiName);

					settingService.updateAllocationOff(userMap);
					settingService.updateAllocationOn(minimiMap);
					
					String userMinimi = memberService.selectUserMinimi(userNickname);
	                session.setAttribute("userMinimi", userMinimi);
				} catch (Exception e) {
					e.printStackTrace();
				}
		
				return "miniHome/mnhMinimiChangeSuccess";
	}

}
