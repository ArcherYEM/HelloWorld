package com.core.tjoeun.index.store.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.index.store.service.BgmItem;
import com.core.tjoeun.index.store.service.StoreService;
import com.core.tjoeun.util.CartItem;
import com.core.tjoeun.util.ShoppingCart;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class StoreController {

	@Autowired
	StoreService storeService;

	@RequestMapping(value = "/store/skinView")
	public String skin(HttpSession session, HttpServletRequest req, Model model) {

		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");

		model.addAttribute("dotori",storeService.getMyDotori(userNickname));
		
		return "/store/skin";
	}

	@RequestMapping(value = "/store/menuView")
	public String menu(HttpSession session, HttpServletRequest req, Model model) {
		
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");

		model.addAttribute("dotori",storeService.getMyDotori(userNickname));

		return "/store/menu";
	}

	@RequestMapping(value = "/store/dotoriView")
	public String dotori(HttpSession session, HttpServletRequest req, Model model) {
		
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");

		model.addAttribute("dotori",storeService.getMyDotori(userNickname));

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
	public String getBgmList(HttpSession session, HttpServletRequest req, Model model, @RequestParam Map map) {
		try {
			Map userMap = new HashMap();
			
			session = req.getSession();
			userMap = (Map) session.getAttribute("userId");
			String userNickname = (String) userMap.get("userNickname");
			
			System.out.println(map);
			List<Map> bgm = storeService.getBgmList(map);
			model.addAttribute("bgmInfo", bgm);
			model.addAttribute("dotori",storeService.getMyDotori(userNickname));
			System.out.println("dbg : " + storeService.getBgmList(userMap));
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
			resultMap.put("result", "success");
			resultMap.put("data", storeService.getBgmList(map));
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@RequestMapping(value = "/store/bgmBuy")
	public String bgmBuy(Model model, @RequestParam(value = "selectedData", required = false) String selectedData) {
		System.out.println("선택된 곡들 : " + selectedData);
	    if (selectedData != null) {
	        ObjectMapper objectMapper = new ObjectMapper();
	        try {
	            List<BgmItem> selectedList = objectMapper.readValue(selectedData, new TypeReference<List<BgmItem>>() {});
	            
	            model.addAttribute("selectedData", selectedList);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return "/store/bgmBuy";
	}
	

	@RequestMapping(value = "/store/bgmBuyOk", method = RequestMethod.POST)
	public String bgmBuyOk(@RequestParam(value = "selectedData", required = false) String selectedData
			, HttpSession session, HttpServletRequest req , Model model) {
        System.out.println("dbg selectedData : " + selectedData);
        
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            List<Map<String, String>> bgmList = objectMapper.readValue(selectedData, new TypeReference<List<Map<String, String>>>(){});
            
            // 선택한 곡들의 title 과 artist 를 저장하는 map
            Map<String, Object> bgmForMap = new HashMap<>();
            
            // service 에서 select 된 title, artist, contentPath, runningTime 을 저장하는 map 리스트
            List<Map<String, Object>> totalMap = new ArrayList<>();
            
            Map userMap = new HashMap();
            session = req.getSession();
			userMap = (Map) session.getAttribute("userId");
			String userNickname = (String) userMap.get("userNickname");
            

            for (int i = 0; i < bgmList.size(); i++) {
                Map<String, String> bgmItem = bgmList.get(i);
                
                String title = bgmItem.get("title");
                String artist = bgmItem.get("artist");
                
                System.out.println("title : " + title);
                System.out.println("artist : " + artist);
                
                bgmForMap.put("title", title);
                bgmForMap.put("artist", artist);
                
                // storeService.getBgmList(bgmForMap) 호출하여 결과를 반환
                List<?> resultList = storeService.getBgmList(bgmForMap);
                
                // 결과를 totalMap에 추가
                if (resultList != null && !resultList.isEmpty()) {
                	totalMap.addAll((List<Map<String, Object>>) resultList);
                }
                
                System.out.println("bgmForMap : " + bgmForMap);
            }
            
            // totalMap에 필요한 정보가 저장됨
            for (Map<String, Object> resultMap : totalMap) {
                String titleDb = (String) resultMap.get("title");
                String artistDb = (String) resultMap.get("artist");
                String runningTimeDb = (String) resultMap.get("runningTime");
                String contentPathDb = (String) resultMap.get("contentPath");
                
                System.out.println("titleDb : " + titleDb);
                System.out.println("artistDb : " + artistDb);
                System.out.println("runningTimeDb : " + runningTimeDb);
                System.out.println("contentPathDb : " + contentPathDb);
                
                System.out.println("resultMap : " + resultMap);
                
                resultMap.put("userNickname", userNickname);
                
                storeService.putBgm(resultMap);
                System.out.println("totalMap : " + totalMap);
//                결과값
//                totalMap : [{contentPath=/resources/sounds/tiara-boPeepBoPeep.mp3, bgmPrice=10, artist=티아라
//                		, runningTime=03:45, title=Bo Peep Bo Peep, seq=11}
//                , {contentPath=/resources/sounds/dongbangsinki-risingSun.map, bgmPrice=10, artist=동방신기
//                		, runningTime=04:40, title=라이징 썬, seq=13}]
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

	    return "/store/bgmBuySuccess";
	}

	
	@RequestMapping(value = "/store/minimiView", method= {RequestMethod.GET, RequestMethod.POST})
	public String selectStoreList(HttpSession session, HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int page) throws Exception {
	    try {
	    	
			Map userMap = new HashMap();
			
			session = req.getSession();
			userMap = (Map) session.getAttribute("userId");
			String userNickname = (String) userMap.get("userNickname");
			
	        Map minimiMap = new HashMap();
	        minimiMap.put("page", String.valueOf(page));
	        minimiMap.put("category", "minimi");
	        List<Map> minimi = storeService.getStroeMinimiList(minimiMap);
	        model.addAttribute("minimi", minimi);
	        model.addAttribute("totalPage", storeService.selectStoreCnt(minimiMap));
	        model.addAttribute("dotori",storeService.getMyDotori(userNickname));
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "/store/minimi";
	}

	@RequestMapping(value = "/store/orderView")
	public String orderView() {

		return "/store/order";
	}

	@GetMapping("/store/loadCart")
	@ResponseBody
    public List<CartItem> loadCart(HttpSession session) {
        ShoppingCart shoppingCart = getOrCreateShoppingCart(session);
        return shoppingCart.getCartItems();
    }

    @PostMapping("/store/addToCart")
    @ResponseBody
    public void addToCart(@RequestBody CartItem item, HttpSession session) {
        ShoppingCart shoppingCart = getOrCreateShoppingCart(session);
        shoppingCart.addToCart(item);
    }

    private ShoppingCart getOrCreateShoppingCart(HttpSession session) {
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            session.setAttribute("cart", shoppingCart);
        }
        return shoppingCart;	
    }
	
    @PostMapping("/store/clearCart")
    @ResponseBody
    public void clearCart(HttpSession session) {
        ShoppingCart shoppingCart = getOrCreateShoppingCart(session);
        shoppingCart.clearCart();
    }
}
