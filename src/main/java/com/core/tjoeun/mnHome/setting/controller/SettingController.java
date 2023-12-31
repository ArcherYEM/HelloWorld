package com.core.tjoeun.mnHome.setting.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
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
	
	@RequestMapping(value = {"/mnHome/settingFriends/{userNickname}", "/mnHome/settingFriends/{userNickname}/{friendName}"})
	public String settingFriends(@PathVariable String userNickname
								,@PathVariable Optional<String> friendName, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		Map nameMap = new HashMap();
		nameMap.put("userNickname", userNickname);
		
		String name = null;
		if(friendName.isPresent()) {
			name = friendName.get();
			nameMap.put("name", name);
			System.out.println(userNickname + " | " + name);
		}
		
		//일촌 목록 가져오기 
		List<HashMap> fList = new ArrayList<>(settingService.selectFriends(nameMap));
		List<Map> bf = new ArrayList<Map>();
		List<Map> fReq = new ArrayList<Map>();
		List<Map> fRes = new ArrayList<Map>();
		
		if(fList != null && fList.size()>0) {
			
			for(Map fmap :fList) {
				if( (int)fmap.get("fStatus") == 1 ){
					bf.add(fmap);
				}else if((fmap.get("userNickname").equals(userNickname) && Integer.parseInt(fmap.get("fStatus").toString())  == 0 )) {
					
					fReq.add(fmap);
				}else if((fmap.get("friendNickname").equals(userNickname) && Integer.parseInt(fmap.get("fStatus").toString())  == 0 )) {
					
					fRes.add(fmap);
				}
			}
			
			System.out.println("bf :" + bf.size() + "| fReq :" + fReq.size() + "| fRes :" + fRes.size());
		}
		model.addAttribute("bf", bf);
		model.addAttribute("fReq", fReq);
		model.addAttribute("fRes", fRes);
		model.addAttribute("fName",name);
		
		
		return "miniHome/settingFriends";
	}
	
	@RequestMapping(value = "/mnHome/friendRequest")
	@ResponseBody
	public Map requestFriendship( @RequestBody Map map) {
		
		Map result = new HashMap<String, String>();
		try {
			int isSuccess = settingService.insertFriendRequest(map);
			if(isSuccess == 1) {
				result.put("code", "1");
			}else if(isSuccess == -1) {
				result.put("code", "-1");
			}
		} catch (Exception e) {
			result.put("msg", "실패");
			e.printStackTrace();
		}
		
		return result;
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
	
	
	@RequestMapping(value = "/mnHome/acceptFriends")
	@ResponseBody
	public Map acceptFriendship(@RequestBody Map map) {
		
		Map result = new HashMap<String, String>();
		try {
			settingService.updateFriends(map);
			result.put("msg", "성공");
		} catch (Exception e) {
			result.put("msg", "실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "/mnHome/rejectFriends")
	@ResponseBody
	public Map rejectFriendship(@RequestBody Map map) {
		
		Map result = new HashMap<String, String>();
		try {
			settingService.updateFriends(map);
			result.put("msg", "성공");
		} catch (Exception e) {
			result.put("msg", "실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "/mnHome/cancleFriends")
	@ResponseBody
	public Map cancleFriendship(@RequestBody Map map) {
		
		Map result = new HashMap<String, String>();
		try {
			settingService.updateFriends(map);
			result.put("msg", "성공");
		} catch (Exception e) {
			result.put("msg", "실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "/mnHome/getFriends")
	@ResponseBody
	public Map getFriendship(@RequestBody Map map) {
		
		Map result = new HashMap<String, String>();
		try {
			settingService.updateFriends(map);
			result.put("msg", "성공");
		} catch (Exception e) {
			result.put("msg", "실패");
			e.printStackTrace();
		}
		
		return result;
	}

}
