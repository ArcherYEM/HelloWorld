package com.core.tjoeun.main.member.cotroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.core.tjoeun.main.member.service.MemberService;

@Controller
@RequestMapping("/main/member")
public class MemberController {

    @Autowired
    MemberService memberService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam Map map, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse res) throws Exception {
        Map resultMap = new HashMap<>();
        resultMap = memberService.login(map);

        if (resultMap != null) {
            session.setAttribute("userId", resultMap);

            Cookie sessionCookie = new Cookie("sessionId", session.getId());
            res.addCookie(sessionCookie);

            model.addAttribute("loginResult", resultMap);
            return "index/loginHome";
        } else {
            model.addAttribute("loginResult", 0);
            return "home";
        }
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
}