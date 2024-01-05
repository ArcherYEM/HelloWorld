package com.core.tjoeun.index.store.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	

	@RequestMapping(value = "/store/bgmBuyOk")
	public String bgmByOk(@RequestParam("userNickname") String bgmList, HttpSession session, HttpServletRequest req) {
		System.out.println("dbg : " + bgmList);
		
		Map userMap = new HashMap();
		
		session = req.getSession();
		String userNickname = (String) session.getAttribute("userNickname");
		
		Map map = new HashMap();
		map.put("userNickname", userNickname);
		map.put("bgmList", bgmList);
		
		try {
			storeService.putBgm(map);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/store/bgmBuySuccess";
	}
	
	@RequestMapping(value = "/store/minimiView", method= {RequestMethod.GET, RequestMethod.POST})
	public String selectStoreList(Model model, @RequestParam(defaultValue = "1") int page) throws Exception {
	    try {
	        Map minimiMap = new HashMap();
	        minimiMap.put("page", String.valueOf(page));
	        minimiMap.put("category", "minimi");
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
	
	
}
