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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.setting.service.SettingService;

@Controller
public class SettingController {

	@Autowired
	SettingService settingService;

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/miniHome/setting")
	public String settingView() {

		return "miniHome/setting";
	}

	@RequestMapping(value = "/miniHome/settingBgm")
	public String settingBgmView() {

		return "miniHome/settingBgm";
	}

	@RequestMapping(value = "/miniHome/settingMenu")
	public String settingMenuView() {

		return "miniHome/settingMenu";
	}

	@RequestMapping(value = "/miniHome/settingSkin")
	public String settingSkinView() {

		return "miniHome/settingSkin";
	}

	@RequestMapping(value = "/miniHome/settingDotoriUse")
	public String settingDotoriUseView() {

		return "miniHome/settingDotoriUse";
	}

	@RequestMapping(value = "/miniHome/settingDotoriCharge")
	public String settingDotoriChargeView() {

		return "miniHome/settingDotoriCharge";
	}

	@RequestMapping(value = "/miniHome/settingFriends")
	public String settingFriendsView() {

		return "miniHome/settingFriends";
	}

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
					System.out.println("오프");
					settingService.updateAllocationOn(minimiMap);
					System.out.println("온");
					
					String userMinimi = memberService.selectUserMinimi(userNickname);
	                session.setAttribute("userMinimi", userMinimi);
				} catch (Exception e) {
					e.printStackTrace();
				}
		
				return "miniHome/mnhMinimiChange";
	}

}
