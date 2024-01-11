package com.core.tjoeun.index.member.cotroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    
    @Value("${default.user.minimi.path}")
    private String defaultMinimi;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map login(@RequestBody Map req, Model model,HttpSession session, HttpServletResponse res) {
        Map resultMap = new HashMap<>();
        try {
            Map loginInfo = new HashMap<>();
            loginInfo.put("userEmail", req.get("userEmail"));
            loginInfo.put("userPassword", req.get("userPassword"));


            Map result = memberService.login(loginInfo);
            String userNickname = "";

            if (result != null) {
                // 로그인 성공 시
                session.setAttribute("userId", result);
                session.setAttribute("userDotoriCnt", result.get("currentDotori"));
                session.setAttribute("userNickname", result.get("userNickname"));                
                session.setAttribute("userEmail", result.get("userEmail"));                

                resultMap.put("resultCode", "1");
                resultMap.put("userEmail", result.get("userEmail"));
                resultMap.put("userPassword", result.get("userPassword"));
                resultMap.put("userNickname", result.get("userNickname"));
                resultMap.put("userDotoriCnt", result.get("currentDotori"));
                
                userNickname = (String) result.get("userNickname");
                String userMinimi = memberService.selectUserMinimi(userNickname);
                System.out.println("userMinimi1 : " + userMinimi);
                resultMap.put("contentPath", userMinimi);
                System.out.println("userMinimi2 : " + userMinimi);
                
                session.setAttribute("userMinimi", userMinimi);
                if(userMinimi==null) {
                	session.setAttribute("userMinimi", defaultMinimi);
                }                
            
                Cookie userCookie = new Cookie("userEmail", result.get("userEmail").toString());
                userCookie.setMaxAge(60 * 60 * 24 * 7);
                userCookie.setPath("/");
                res.addCookie(userCookie);
                
            } else {
                // 로그인 실패 시
                resultMap.put("resultCode", "0");
            } 
        } catch (Exception e) {
            // 예외 발생 시
            resultMap.put("resultCode", "-1");
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

    @RequestMapping(value="/afterFindId", method=RequestMethod.POST)
    public String afterFindId(Model model, @RequestParam Map map) {
       String userId = "";
       
       Map resultMap = memberService.findId(map);
       
       if(resultMap != null) {
          userId = (String)resultMap.get("userEmail");
          model.addAttribute("findId", userId);
          model.addAttribute("userName", map.get("userName"));
          model.addAttribute("resultCode","1");
       }else {
    	  model.addAttribute("resultCode","0");
    	  model.addAttribute("msg", "정보를 찾을 수 없습니다.");
       }
            
        return "index/findIdResult";
     
    }

    @RequestMapping(value="/emailCheck", method=RequestMethod.POST)
    @ResponseBody
    public Map emailCheck(@RequestBody Map req) {
        Map resultMap = new HashMap();
        try {
            Map emailMap = new HashMap();
            emailMap.put("userEmail", req.get("userEmail"));
            resultMap = memberService.selectEmail(emailMap);

            // resultMap 초기화
            if(resultMap == null) {
                resultMap = new HashMap();
                resultMap.put("resultCode", "1");
            } else {
                resultMap.put("resultCode", "0");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("resultCode", "0");
        }

        return resultMap;
    }

    @RequestMapping(value="/phoneCheck", method=RequestMethod.POST)
    @ResponseBody
    public Map phoneCheck(@RequestBody Map req) {
       Map resultMap = new HashMap();
       try {
          Map phoneMap = new HashMap();
          phoneMap.put("userPhone", req.get("userPhone"));
          resultMap = memberService.selectPhone(phoneMap);

          if(resultMap == null) {
             resultMap = new HashMap();
             resultMap.put("resultCode", "1");
          } else {
             resultMap.put("resultCode", "0");
          }
       } catch (Exception e) {
          e.printStackTrace();
          resultMap.put("resultCode", "0");
       }

       return resultMap;
    }
    
    @RequestMapping(value = "/findPwView", method = RequestMethod.GET)
    public String findPwView() {
        return "index/findPw";
    }
    
    @RequestMapping(value = "/afterFindPw", method = RequestMethod.POST)
    public String afterFindPw(Model model, @RequestParam Map map) {
    	String userId = "";
        String page = "";
        
        Map resultMap = memberService.findId(map);
        
        if(resultMap != null) {
           userId = (String)resultMap.get("userEmail");
           model.addAttribute("findId", userId);
           model.addAttribute("resultCode","1");
           page = "index/findPwResult";
           
        }else {
     	  model.addAttribute("resultCode","0");
     	  model.addAttribute("msg", "정보를 찾을 수 없습니다.");
     	  page = "index/findPw";
     	  
        }
    	
        return page;
    }
    
    @RequestMapping(value = "/findPw", method = RequestMethod.POST)
    public String findPw(Model model, @RequestParam Map map) {
    	try {
			memberService.updatePw(map);
			model.addAttribute("updateResult", "1");
			model.addAttribute("msg", "변경되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("updateResult", "0");
			model.addAttribute("msg", "잠시 후 다시 시도해주세요.");
		}
    	
        return "index/findPwResult";
    }

   

    @RequestMapping(value = "/signUpConfirm", method = RequestMethod.POST)
    public String signUpConfirm(@RequestParam Map<String, String> map) throws Exception {
        memberService.signUp(map);
        return "home";
    }
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String indexHome() {
       return "home";
    }
    
}