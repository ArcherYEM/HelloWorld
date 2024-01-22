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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.main.dao.MainDao;
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
	
	@Autowired
	MainDao mainDao;
	
	@RequestMapping(value = "/mnHome/settingView/{userNickname}")
	public String settingView(@PathVariable String userNickname, Model model) {
		
		//홈피 주인 성별 가져오기
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("userNickname", userNickname);
		model.addAttribute("title", map.get("title"));
		
        //접속중인 유저의 친구 전부 가져오기
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "miniHome/setting";
	}
	
	@RequestMapping(value = "/mnHome/settingInfoEditView/{userNickname}")
	public String settingInfoEditView(@PathVariable String userNickname, Model model) {
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
        //접속중인 유저의 친구 전부 가져오기
        List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);
		
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
        
		return "miniHome/settingInfoEdit";
	}

	@RequestMapping(value = "/mnHome/settingBgm/{userNickname}")
	public String settingBgmView(@PathVariable String userNickname, Model model) {
		
		//홈피 주인 성별 가져오기
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		Map inputMap= new HashMap();
		inputMap.put("userNickname", userNickname);
		
		String title = "";
		String artist = "";
		String runningTime = "";
		String contentPath = "";
		int allocation = 0;
		
		List<Map> bgmMap = settingService.selectMyBgm(inputMap);
		
		model.addAttribute("bgmMap",bgmMap);
		
        //접속중인 유저의 친구 전부 가져오기
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
        
        //플레이 리스트 가져오기
        List<Map> playList = settingService.selectPlayList(userNickname);
        model.addAttribute("playList",playList);
		
		return "miniHome/settingBgm";

	}


	@RequestMapping(value = "/mnHome/settingMenu/{userNickname}")
	public String settingMenuView(@PathVariable String userNickname, Model model) {
		
		//홈피 주인 성별 가져오기
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("title", userMap.get("title"));
		
		Map putMap = new HashMap();
		putMap.put("userNickname", userMap.get("userNickname"));
		putMap.put("category", "menu");
		
		try {
			List<Map<String, Object>> onMenu = settingService.allocationOnSkinMenu(putMap);
			List<String> productNames = new ArrayList<>();
			
			for (Map<String, Object> menu : onMenu) {
				String productName = (String)menu.get("productName");
				productNames.add(productName);
			}
			
			model.addAttribute("onMenu", onMenu);
			model.addAttribute("productNames", productNames);
			
			List<Map<String, Object>> menuMap = settingService.selectSkinMenu(putMap);
			model.addAttribute("menuMap", menuMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
		
		return "miniHome/settingMenu";
	}
	
	@RequestMapping(value = "/mnHome/menuChoice", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> menuChoice(@RequestBody Map<String, String> requestData, HttpSession session, Model model) {
	    String selectedProductName = requestData.get("selectedProductName");
		
		Map userMap = new HashMap();
		userMap = (Map)session.getAttribute("userId");
		String userNickname = (String)userMap.get("userNickname");
		
		Map menuMap = new HashMap();
		menuMap.put("userNickname", userNickname);
		menuMap.put("productName", selectedProductName);
		menuMap.put("category", "menu");
		
		try {
			settingService.updateAllocationOff(menuMap);
			settingService.updateAllocationOn(menuMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map putMap = new HashMap();
		putMap.put("userNickname", userMap.get("userNickname"));
		putMap.put("category", "menu");
		
		//방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Map<String, Object>> userMenu = settingService.allocationOnSkinMenu(putMap);
		
		model.addAttribute("menuMap", userMenu);
		
		if (userMenu != null && !userMenu.isEmpty() ) {
			Map<String, Object> menuMap2 = userMenu.get(0);
			
			if (menuMap2 != null) {
				menuMap2.put("resultCode", "1");
			} else {
				menuMap2.put("resultCode","0");
			}
			
			return menuMap2;
		} else {
		
			return new HashMap<>();
		}
	}

	@RequestMapping(value = "/mnHome/settingSkin/{userNickname}")
	public String settingSkinView(@PathVariable String userNickname, Model model) {
		
		//홈피 주인 성별 가져오기
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		Map userMap = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", userMap.get("userName"));
		model.addAttribute("title", userMap.get("title"));
		
		Map putMap = new HashMap();
		putMap.put("userNickname", userMap.get("userNickname"));
		putMap.put("category", "skin");
		
		try {
		    List<Map<String, Object>> onSkin = settingService.allocationOnSkinMenu(putMap);
		    List<String> productNames = new ArrayList<>(); 
		    
		    for (Map<String, Object> skin : onSkin) {
		        String productName = (String) skin.get("productName"); 
		        productNames.add(productName); 
		    }
		    
		    model.addAttribute("onSkin", onSkin);
		    model.addAttribute("productNames", productNames); 

		    List<Map<String, Object>> skinMap = settingService.selectSkinMenu(putMap);
			model.addAttribute("skinMap", skinMap);
			
			// menu color 적용하기
	        Map callMenu = new HashMap();
	        callMenu.put("category", "menu");
	        callMenu.put("userNickname", userNickname);
	        
	      //방문자 수 가져오기
	        try {
				Map visitCntMap = new HashMap();
				visitCntMap = mainDao.selectVisitCnt(userNickname);
				model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
				model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
			} catch (Exception e) {
				e.printStackTrace();
			}
	        
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "miniHome/settingSkin";
	}
	
	@RequestMapping(value = "/mnHome/skinChoice", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> skinChoice(@RequestBody Map<String, String> requestData, HttpSession session, Model model) {
	    String selectedProductName = requestData.get("selectedProductName");
		
		Map userMap = new HashMap();
		userMap = (Map)session.getAttribute("userId");
		String userNickname = (String)userMap.get("userNickname");
		
			Map skinMap = new HashMap();
			skinMap.put("userNickname", userNickname);
			skinMap.put("productName", selectedProductName);
			skinMap.put("category", "skin");
			
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
			
			try {
				settingService.updateAllocationOff(skinMap);
				settingService.updateAllocationOn(skinMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Map putMap = new HashMap();
			putMap.put("userNickname", userMap.get("userNickname"));
			putMap.put("category", "skin");
			
			List<Map<String, Object>> userSkin = settingService.allocationOnSkinMenu(putMap);
			model.addAttribute("skinMap", userSkin);
			if (userSkin != null && !userSkin.isEmpty()) {
			    Map<String, Object> skinMap2 = userSkin.get(0);
			    
			    if(skinMap2 != null) {
			    	skinMap2.put("resultCode", "1");
				} else {
					skinMap2.put("resultCode", "0");
				}
			    return skinMap2;
			} else {
			    return new HashMap<>();
			}
		
	}

	@RequestMapping(value = "/mnHome/settingDotoriUse/{userNickname}")
	public String settingDotoriUseView(@PathVariable String userNickname, Model model) {
	    List<Map> dotoriMap = settingService.selectDotoriUse(userNickname);

		//홈피 주인 성별 가져오기
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
	    
	    for (Map map : dotoriMap) {
	        String dotoriUseFor = (String) map.get("dotoriUseFor");
	        // "구매-"를 기준으로 문자열을 분할합니다.
	        String[] parts = dotoriUseFor.split("구매-");
	        if (parts.length == 2) {
	            map.put("category", parts[0].trim()); // "미니미" 등의 카테고리
	            map.put("detail", parts[1].trim()); // "스타픽시" 등의 상세 내용
	        }
	    }

	    Map userInfoMap = mainService.getUserInfo(userNickname);
	    model.addAttribute("userName", userInfoMap.get("userName"));
	    model.addAttribute("title", userInfoMap.get("title"));
	    model.addAttribute("dotoriUse", dotoriMap);
	    
        //접속중인 유저의 친구 전부 가져오기
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	    return "miniHome/settingDotoriUse";
	}

	@RequestMapping(value = "/mnHome/settingDotoriCharge/{userNickname}")
	public String settingDotoriChargeView(@PathVariable String userNickname, Model model) {
	    List<Map> dotoriMap = settingService.selectDotoriCharge(userNickname);

		//홈피 주인 성별 가져오기
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
	    
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		model.addAttribute("dotoriCharge", dotoriMap);		
		
        //접속중인 유저의 친구 전부 가져오기
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "miniHome/settingDotoriCharge";
	}
	
	@RequestMapping(value = {"/mnHome/settingFriends/{userNickname}", "/mnHome/settingFriends/{userNickname}/{friendName}"})
	public String settingFriends(@PathVariable String userNickname
								,@PathVariable Optional<String> friendName, Model model) {
		
		//홈피 주인 성별 가져오기
		String userGender = memberService.selectUserGender(userNickname);
		model.addAttribute("userGender",userGender);
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		Map nameMap = new HashMap();
		nameMap.put("userNickname", userNickname);
		
        //접속중인 유저의 친구 전부 가져오기
        List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);
		
		String name = null;
		if(friendName.isPresent()) {
			name = friendName.get();
			nameMap.put("name", name);
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
		}
		model.addAttribute("bf", bf);
		model.addAttribute("fReq", fReq);
		model.addAttribute("fRes", fRes);
		model.addAttribute("fName",name);
		
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
	    try {
	        resultMap = settingService.getSearchUser(map);
	        resultMap.put("resultCode", "1");
	    } catch (Exception e) {
	        e.printStackTrace();
	        resultMap.put("resultCode", "0");
	    }
	    return resultMap;
	}
	
	@RequestMapping(value = "/miniHome/setting", method = RequestMethod.POST)
	@ResponseBody
	public Map setting(@RequestBody Map map, Model model, HttpSession session) {
		Map resultMap = common(map);
		
		resultMap.put("userName", resultMap.get("name"));
	    resultMap.put("userNickname", resultMap.get("nickname"));
	    resultMap.put("userPhone", resultMap.get("phone"));
	    resultMap.put("createDate", resultMap.get("date"));
	   
	  //방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt((String) session.getAttribute("userNickname"));
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return resultMap;
	}

	@RequestMapping(value = "/mnHome/searchFriends", method = RequestMethod.POST)
	@ResponseBody
	public Map searchFriends(@RequestBody Map map) {
	    return common(map);
	}
	
	@RequestMapping("/mnHome/mnhMinimiChangeView")
	public String selectSettingUserStorage(HttpSession session, HttpServletRequest req, Model model) throws SQLException {
		Map userMap = new HashMap();
		
		userMap = (Map) session.getAttribute("userId");
	    String userNickname = (String) userMap.get("userNickname");
	      
	 //방문자 수 가져오기
       try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	    try {
	        List<Map<String, Object>> userStorageData = settingService.selectSettingUserStorage(userNickname);

	        model.addAttribute("userStorageList", userStorageData);
	    } catch (SQLException sqle) {
	        sqle.printStackTrace();
	        throw sqle;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "miniHome/mnhMinimiChange";
	}
	
	@RequestMapping(value="/mnHome/mnhMinimiChangeAction", method = RequestMethod.POST)
	public String MinimiChange(@RequestParam ("selectedUserStorage") String minimiName
								,HttpSession session, HttpServletRequest req, Model model ) {
		
				try {
					Map userMap = new HashMap();
					userMap = (Map) session.getAttribute("userId");
					String userNickname = (String) userMap.get("userNickname");
					
					Map minimiMap = new HashMap();
					minimiMap.put("userNickname",userNickname);
					minimiMap.put("productName",minimiName);
					minimiMap.put("category","minimi");

					settingService.updateAllocationOff(minimiMap);
					settingService.updateAllocationOn(minimiMap);
					
					String userMinimi = memberService.selectUserMinimi(userNickname);
	                session.setAttribute("userMinimi", userMinimi);
				} catch (Exception e) {
					e.printStackTrace();
				}
		
				//방문자 수 가져오기
		        try {
					Map visitCntMap = new HashMap();
					visitCntMap = mainDao.selectVisitCnt((String) session.getAttribute("userNickname"));
					model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
					model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
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
	@RequestMapping(value = "/mnHome/changeName", method = RequestMethod.POST)
	@ResponseBody
	public int changeName(@RequestBody Map<String, String> requestData, HttpSession session) {
		int result = 0;
		
		if(requestData.get("originalName")==null) {
			result = 4;
		}
				
		try {
			result = settingService.changeName(requestData);
			if(result == 1) {
				session.setAttribute("userName", requestData.get("changedName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "/mnHome/changeNickname", method = RequestMethod.POST)
	@ResponseBody
	public int changeNickname(@RequestBody Map<String, String> requestData,HttpSession session) {
		
		int result = 0;
		try {
			result = settingService.changeNickname(requestData);
			if(result == 1) {
				session.setAttribute("userNickname", requestData.get("changedNickname"));
			}
		} catch (Exception e) {
			String error = e.getMessage();
			if(e.getMessage().contains("Duplicate")) {
				result=3;
			}
		}
		return result;
	}

	@RequestMapping(value = "/mnHome/changeNumber", method = RequestMethod.POST)
	@ResponseBody
	public int changeNumber(@RequestBody Map<String, String> requestData) {

		int result = 0;
		try {
			result = settingService.changeNumber(requestData);
		} catch (Exception e) {
			String error = e.getMessage();
			if(e.getMessage().contains("Duplicate")) {
				result=3;
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/mnHome/addPlayList", method = RequestMethod.POST)
	@ResponseBody
	public int addPlayList(@RequestBody Map requestData) {
		Map param = new HashMap();
		param.put("userNickname", requestData.get("userNickname"));
		param.put("title", requestData.get("title"));
		
		int result = settingService.addPlayList(param);
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			String error = e.getMessage();
		}
		return result;
	}
	
	@RequestMapping(value = "/mnHome/removePlayList", method = RequestMethod.POST)
	@ResponseBody
	public int removePlayList(@RequestBody Map requestData) {
		Map param = new HashMap();
		param.put("userNickname", requestData.get("userNickname"));
		param.put("title", requestData.get("title"));
		
		int result = settingService.removePlayList(param);
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			String error = e.getMessage();
		}
		return result;
	}
}
