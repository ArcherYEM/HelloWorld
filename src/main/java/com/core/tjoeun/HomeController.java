package com.core.tjoeun;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.core.tjoeun.index.store.service.StoreService;

/**
 * Handles requests for the application home page.
 */
@EnableCaching
@Controller
public class HomeController {
	
	@Autowired
	StoreService storeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, HttpServletRequest req, Locale locale, Model model) {
	    logger.info("Welcome home! The client locale is {}.", locale);

	    session = req.getSession(false); // false를 전달하면 새 세션이 생성되지 않습니다.
	    if (session != null) {
	        Map userMap = (Map) session.getAttribute("userId");
	        if (userMap != null) {
	            String userNickname = (String) userMap.get("userNickname");
	            if (userNickname != null) {
	                model.addAttribute("dotori", storeService.getMyDotori(userNickname));
	            } else {
	                // userNickname이 null인 경우의 처리
	            }
	        } else {
	            // userMap이 null인 경우의 처리
	        }
	    } else {
	        // 세션이 null인 경우의 처리
	    }
	    return "home";
	}
	
}
