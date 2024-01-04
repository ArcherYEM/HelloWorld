package com.core.tjoeun.index.store.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.index.store.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	StoreService storeService;

//	@RequestMapping(value = "/store/minimiView")
//	public String minimi() {
//		
//		return "store/minimi";
//	}

	@RequestMapping(value = "/store/skinView")
	public String skin() {

		return "/store/skin";
	}

	@RequestMapping(value = "/store/menuView")
	public String menu() {

		return "/store/menu";
	}

	@RequestMapping(value = "/store/dotoriView")
	public String dotori() {

		return "/store/dotori";
	}
	
	@RequestMapping(value = "/store/dotoriBuy")
	public String dotoriBuy(@RequestParam("content") String dotoriCharge,HttpSession session, HttpServletRequest req) {

		System.out.println("테스트:"+dotoriCharge);
		
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");
		Map map = new HashMap();
		map.put("userNickname",userNickname);
		map.put("dotoriCharge", dotoriCharge);
		
		storeService.insertDotoriC(map);

		String result = storeService.selectDotori(userNickname);
		System.out.println(result);		

		if(result==null) {
			storeService.insertDotori(map);
		} else {
			storeService.updateDotori(map);
		}

		return "/store/dotoriBuySuccess";
	}

	@RequestMapping(value = "/store/bgmView")
	public String getBgmList(Model model, @RequestParam Map map) {
		try {
			List<Map> bgm = storeService.getBgmList(map);
			model.addAttribute("bgmInfo", bgm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/store/bgm";
	}

	@RequestMapping(value = "/store/bgm/searchBgm", method = RequestMethod.POST)
	@ResponseBody
	public Map searchBgmList(@RequestParam Map map) {

		Map resultMap = new HashMap();

		try {
			storeService.searchBgm(map);
			resultMap.put("result", "success");
			resultMap.put("data", storeService.getBgmList(map));
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@RequestMapping(value = "/store/minimiView", method= {RequestMethod.GET, RequestMethod.POST})
	public String selectStoreList(Model model, @RequestParam(defaultValue = "1") int page) throws Exception {
	    try {
	        Map minimiMap = new HashMap();
	        minimiMap.put("page", String.valueOf(page));
	        List<Map> minimi = storeService.getStroeMinimiList(minimiMap);
	        model.addAttribute("minimi", minimi);
	        model.addAttribute("totalPage", storeService.selectStoreCnt(minimiMap));
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "/store/minimi";
	}

	@RequestMapping(value = "/store/orderView")
	public String orderView() {

		return "/store/order";
	}

	
}
