package com.core.tjoeun.index.member.cotroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.index.member.service.MemberService;

@Controller
@RequestMapping("/index/member")
public class MemberController {

    @Autowired
    MemberService memberService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map login(@RequestBody Map req, HttpSession session) {
        Map resultMap = new HashMap<>();
        try {
            Map loginInfo = new HashMap<>();
            loginInfo.put("userEmail", req.get("userEmail"));
            loginInfo.put("userPassword", req.get("userPassword"));

            Map result = memberService.login(loginInfo);

            if (result != null) {
                // 로그인 성공 시
                session.setAttribute("userId", result);
                resultMap.put("resultCode", "1");
                resultMap.put("userEmail", result.get("userEmail"));
            } else {
                // 로그인 실패 시
                resultMap.put("resultCode", "0");
            }
        } catch (Exception e) {
            // 예외 발생 시
            resultMap.put("resultCode", "0");
        }

        return resultMap;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        session.invalidate();

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        return "redirect:/";
    }

    @RequestMapping("/signUp")
    public String signUp() {
        return "index/signUp";
    }

    @RequestMapping("/findId")
    public String findId() {
        return "index/findId";
    }

    @RequestMapping("/afterFindId")
    public String afterFindId() {
        return "index/afterFindId";
    }

    @RequestMapping(value = "/findPw", method = RequestMethod.GET)
    public String findPw() {
        return "index/findPw";
    }

    @RequestMapping(value = "/afterFindPw", method = RequestMethod.GET)
    public String afterFindPw() {
        return "index/afterFindPw";
    }

    @RequestMapping(value = "/signUpConfirm", method = RequestMethod.POST)
    public String signUpConfirm(@RequestParam Map<String, String> map) throws Exception {
        memberService.signUp(map);
        return "redirect:/";
    }
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String indexHome() {
    	return "home";
    }
}
