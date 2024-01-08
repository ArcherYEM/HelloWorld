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
	public String bgmBuyOk(@RequestParam(value = "selectedData", required = false) String selectedData,
            @RequestParam(value = "totalPrice", required = false) int totalPrice,
            HttpSession session, HttpServletRequest req, Model model) {
		
        System.out.println("dbg selectedData : " + selectedData);
        
        Map userMap = new HashMap();
        session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");
        
        try {
	         // 현재 보유도토리와 결제 도토리 값 비교
	            int myDtr = storeService.getMyDotori(userNickname);
	            System.out.println("myDtr : " + myDtr);
	            System.out.println("totalPrice : " + totalPrice);
	            
	            int amount = 0;
	            amount = myDtr - totalPrice;
	            System.out.println("amount : " + amount);
	            if (amount < 0) {
	            	return "/store/bgmBuyFail";
	            } else {
	            	ObjectMapper objectMapper = new ObjectMapper();
	                List<Map<String, String>> bgmList = objectMapper.readValue(selectedData, new TypeReference<List<Map<String, String>>>(){});
	                
	                // 선택한 곡들의 title 과 artist 를 저장하는 map
	                Map<String, Object> bgmForMap = new HashMap<>();
	                
	                // service 에서 select 된 title, artist, contentPath, runningTime 을 저장하는 map 리스트
	                List<Map<String, Object>> totalMap = new ArrayList<>();
	                
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
    	            } // for문 괄호
    	            
    	            // 도토리차감
    	            Map updateMap = new HashMap();
    	            updateMap.put("userNickname", userNickname);
    	            updateMap.put("amount", amount);
    	            storeService.deductDotori(updateMap);
    	            System.out.println("myDtr : " + myDtr);
    	            
    	            return "/store/bgmBuySuccess";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/error";
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
	        List<Map> minimi = storeService.getStoreMinimiList(minimiMap);
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
        
        session.setAttribute("cart", shoppingCart);
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
        
        session.setAttribute("cart", shoppingCart);
    }
    
    @PostMapping("/store/updateDotoriCount")
    @ResponseBody
    public int updateDotoriCount(HttpSession session) {
        Map resultMap = new HashMap();
        resultMap.put("userNickname", session.getAttribute("userNickname"));
        updateCartDotoriCount(session);
        Object currentDotoriObj = session.getAttribute("userDotoriCnt");
        Object userBuyCartObj = session.getAttribute("userBuyCart");
        int result = 0;

        try {
            Long currentDotori = (currentDotoriObj instanceof Long) ? (Long) currentDotoriObj : null;
            Integer userBuyCart = (userBuyCartObj instanceof Integer) ? (Integer) userBuyCartObj : null;

            if (currentDotori != null && userBuyCart != null) {
                result = currentDotori.intValue() - userBuyCart;

                // 장바구니 도토리 개수를 업데이트
                resultMap.put("currentDotori", result);

                int afterBuy = storeService.updateBuyCartDotoriCnt(resultMap);
                return afterBuy == 1 ? 1 : 0;
            } else {
                // 적절한 처리를 수행하거나 예외를 던지는 등의 방법으로 오류를 처리합니다.
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 적절한 오류 처리
            return 0;
        }
    }
    
    private void updateCartDotoriCount(HttpSession session) {
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        
        // 총 도토리 개수를 가져와서 세션에 저장
        int totalDotoriCount = cart.getTotalDotoriCount();
        session.setAttribute("userBuyCart", totalDotoriCount);
    }
    
    @PostMapping("/store/buyCart")
    @ResponseBody
    public int buyCart(HttpSession session) {
    	Map buyCartMap = new HashMap();
    	int result = 0;
    	try {
    		ShoppingCart shoppingCart = getOrCreateShoppingCart(session);
            List<CartItem> cartItems = shoppingCart.getCartItems();
            
            for (CartItem cartItem : cartItems) {
                // cartItem에서 필요한 정보를 추출하여 DB에 저장하거나 처리하는 작업 수행
                String userNickname = (String) session.getAttribute("userNickname");
                String tableCate = cartItem.getTableCate();
                String name = cartItem.getName();
                String contentPath = cartItem.getContentPath();
                
                // 여기서 해당 정보를 이용하여 DB에 저장하거나 처리하는 로직을 작성
                buyCartMap.put("userNickname", userNickname);
                buyCartMap.put("category", tableCate);
                buyCartMap.put("productName", name);
                buyCartMap.put("contentPath", contentPath);
                
                result = storeService.buyCart(buyCartMap);
            }

            return result == 1 ? 1 : 0;
            
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
    }
       
}
