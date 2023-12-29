package com.core.tjoeun.index.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping(value = "/store/minimiView")
	public String selectStoreList(Model model, @RequestParam(defaultValue = "1") int page) throws Exception {
	    try {
	        Map minimiMap = new HashMap();
	        minimiMap.put("page", String.valueOf(page)); // page를 문자열로 변환하여 저장
	        List<Map> minimi = storeService.getStroeMinimiList(minimiMap);
	        model.addAttribute("minimi", minimi);
	        model.addAttribute("totalPage", storeService.selectStoreCnt(minimiMap));
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "/store/minimi";
	}


	
}
