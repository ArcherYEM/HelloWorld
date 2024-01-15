package com.core.tjoeun.index.store.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.core.tjoeun.mnHome.setting.service.SettingService;
import com.core.tjoeun.util.CartItem;
import com.core.tjoeun.util.ShoppingCart;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class StoreController {

	@Autowired
	StoreService storeService;
	
	@Autowired
	SettingService settingService;

	@RequestMapping(value = "/store/skinView")
	public String skin(HttpSession session, HttpServletRequest req, Model model) {
		String userNickname = (String) session.getAttribute("userNickname");
		if (userNickname != null ) {
			int dotori = storeService.getMyDotori(userNickname);
			model.addAttribute("dotori", dotori);
		} else {
			model.addAttribute("dotori", "");
		}
		
		return "/store/skin";
	}

	@RequestMapping(value = "/store/menuView")
	public String menu(HttpSession session, HttpServletRequest req, Model model) {
		String userNickname = (String) session.getAttribute("userNickname");
		if (userNickname != null ) {
			int dotori = storeService.getMyDotori(userNickname);
			model.addAttribute("dotori", dotori);
		} else {
			model.addAttribute("dotori", "");
		}
		return "/store/menu";
	}

	@RequestMapping(value = "/store/dotoriView")
	public String dotori(HttpSession session, HttpServletRequest req, Model model) {
		String userNickname = (String) session.getAttribute("userNickname");
		if (userNickname != null ) {
			int dotori = storeService.getMyDotori(userNickname);
			model.addAttribute("dotori", dotori);
		} else {
			model.addAttribute("dotori", "");
		}
		return "/store/dotori";
	}
	
	@RequestMapping(value = "/store/dotoriBuy")
	public String dotoriBuy(@RequestParam("content") String dotoriCharge
			, @RequestParam("method") String dotoriMethod
			, @RequestParam("price") String dotoriPrice
			, HttpSession session, HttpServletRequest req) {

		
		Map userMap = new HashMap();
		
		session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");
		Map map = new HashMap();
		map.put("userNickname",userNickname);
		map.put("dotoriCharge", dotoriCharge);
		map.put("dotoriMethod", dotoriMethod);
		map.put("dotoriPrice", dotoriPrice);
		
		storeService.insertDotoriC(map);

		String result = storeService.selectDotori(userNickname);	

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
			
			
			List<Map> bgm = storeService.getBgmList(map);
			model.addAttribute("bgmInfo", bgm);
			model.addAttribute("dotori",storeService.getMyDotori(userNickname));
			
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
	public String bgmBuy(Model model
			, @RequestParam(value = "selectedData", required = false) String selectedData) {
		
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
		
        
        Map userMap = new HashMap();
        session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String userNickname = (String) userMap.get("userNickname");
        
        try {
	         // 현재 보유도토리와 결제 도토리 값 비교
	            int myDtr = storeService.getMyDotori(userNickname);
	            int amount = 0;
	            amount = myDtr - totalPrice;
	            
	            if (amount < 0) {
	            	String reason = " [" + (amount * (-1) + "] 개 의 도토리가 부족합니다.");
	            	model.addAttribute("reason", reason);
	            	return "/store/bgmBuyFail";
	            } else {
	            	// 보유 bgm 확인
	            	List<Map> myBgmCheckMap = settingService.selectMyBgm(userMap);
	            	List<String>myBgmTitle = new ArrayList<>();
	            	for (int i = 0; i < myBgmCheckMap.size(); i++) {
	            		Map<String, String> titleMap = myBgmCheckMap.get(i);
	            		String getTitle = titleMap.get("title");
	            		myBgmTitle.add( getTitle);
	            	}
	            	
	            	
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
	                    
	                    bgmForMap.put("title", title);
	                    bgmForMap.put("artist", artist);
	                    
	                    // storeService.getBgmList(bgmForMap) 호출하여 결과를 반환
	                    List<?> resultList = storeService.getBgmList(bgmForMap);
	                    
	                    // 결과를 totalMap에 추가
	                    if (resultList != null && !resultList.isEmpty()) {
	                    	totalMap.addAll((List<Map<String, Object>>) resultList);
	                    }
	                    
	                }
	                
	                // totalMap 에 있는 cartBgmTitle 과 보유중인 myBgmTitle 비교
	                
	               List<String> cartBgmTitle = new ArrayList<>();  // 장바구니 bgm list 를 담을 Map
	               for (int i = 0; i < totalMap.size(); i++) {
	            	   Map<String, Object> tempList = totalMap.get(i);
	            	   String getTitle = (String) tempList.get("title");
	            	   cartBgmTitle.add(getTitle);
	               }
	               
	                
	                List<String> comparison = new ArrayList<>(); // 전체 bgm list 를 담을 Map
	                comparison.addAll(myBgmTitle);
	                comparison.addAll(cartBgmTitle);
	                
	                
	                Collections.sort(comparison);
	                
	                
	                String duplicatedBgm = null;
	                
	                for (int i = 0; i < comparison.size() - 1; i++) {
	                    String currentItem = comparison.get(i);
	                    String nextItem = comparison.get(i + 1);
	                    
	                    if (currentItem.equals(nextItem)) {
	                        
	                        duplicatedBgm = currentItem;
	                        break;
	                    }
	                }

	                if (duplicatedBgm != null) {
                    	String reason = " [" + duplicatedBgm + "] BGM 은 이미 보유하고있습니다.";
                    	model.addAttribute("reason", reason);
                    	return "/store/bgmBuyFail";
	                }
	                
    	            // totalMap에 필요한 정보가 저장됨
    	            for (Map<String, Object> resultMap : totalMap) {
    	                String titleDb = (String) resultMap.get("title");
    	                String artistDb = (String) resultMap.get("artist");
    	                String runningTimeDb = (String) resultMap.get("runningTime");
    	                String contentPathDb = (String) resultMap.get("contentPath");
    	                
    	                resultMap.put("userNickname", userNickname);
    	                
    	                storeService.putBgm(resultMap);
    	            } // for문 괄호
    	            
    	            // 도토리차감
    	            Map updateMap = new HashMap();
    	            updateMap.put("userNickname", userNickname);
    	            updateMap.put("amount", amount);
    	            storeService.deductDotori(updateMap);
    	            
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
	    	Map minimiMap = new HashMap();
	    	minimiMap.put("page", String.valueOf(page));
	    	minimiMap.put("category", "minimi");
	    	List<Map> minimi = storeService.getStoreMinimiList(minimiMap);
	    	model.addAttribute("minimi", minimi);
	    	model.addAttribute("totalPage", storeService.selectStoreCnt(minimiMap));
			
	    	String userNickname = (String) session.getAttribute("userNickname");
			if (userNickname != null ) {
				int dotori = storeService.getMyDotori(userNickname);
				model.addAttribute("dotori", dotori);
			} else {
				model.addAttribute("dotori", "");
			}
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
        
    }

    
    @PostMapping("/store/updateDotoriCount")
    @ResponseBody
    public int updateDotoriCount(HttpSession session) {
        Map resultMap = new HashMap();
        resultMap.put("userNickname", session.getAttribute("userNickname"));
        updateCartDotoriCount(session);
        String currentDotoriStr = session.getAttribute("userDotoriCnt").toString();
        String userBuyCartStr = session.getAttribute("userBuyCart").toString();
        int result = 0;
        	
        try {
        	Integer currentDotori = Integer.parseInt(currentDotoriStr);
        	Integer userBuyCart = Integer.parseInt(userBuyCartStr);
            
            
            if (currentDotori != null && userBuyCart != null) {
                result = currentDotori - userBuyCart;

                if(result < 0) {
                	return -1;
                }
                // 장바구니 도토리 개수를 업데이트
                session.setAttribute("userDotoriCnt", result);
                resultMap.put("currentDotori", result);
                int afterBuy = storeService.updateBuyCartDotoriCnt(resultMap);
                if(afterBuy == 1) {
                	return result;
                } else {
                	throw new Exception();
                }
                
            } else {
                // 적절한 처리를 수행하거나 예외를 던지는 등의 방법으로 오류를 처리합니다.
            	throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 적절한 오류 처리
            return result;
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
    public Map<String, Object> buyCart(HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        try {
            ShoppingCart shoppingCart = getOrCreateShoppingCart(session);
            List<CartItem> cartItems = shoppingCart.getCartItems();
            String userNickname = (String) session.getAttribute("userNickname");
            int resultDotoriCnt = updateDotoriCount(session);

            if (userNickname != null) {
                if (!storeService.hasDuplicateCartItem(cartItems, userNickname)) {
                    if (resultDotoriCnt != -1) {
                        // 중복된 상품이 없으면 구매 로직 수행
                        int buyResult = storeService.buyCart(cartItems, userNickname);

                        if (buyResult == 1) {
                            // 구매 성공
                            // 장바구니 비우기
                            session.setAttribute("cart", shoppingCart);

                            result.put("success", true);
                            result.put("message", "상품 구매가 완료되었습니다.");
                        } else {
                            // 구매 실패
                            result.put("success", false);
                            result.put("message", "상품 구매에 실패했습니다. 다시 시도해주세요.");
                        }
                    } else {
                        result.put("success", false);
                        result.put("message", "보유한 도토리 개수가 부족합니다.");
                    }
                } else {
                    result.put("success", false);
                    result.put("message", "이미 보유하고 있는 상품이 있습니다.");
                }
            } else {
                result.put("success", false);
                result.put("message", "로그인 후 이용해주세요.");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "구매 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return result;
    }

}