package com.core.tjoeun.mnHome.profile.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.core.tjoeun.mnHome.profile.service.ProfileService;

@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;

    @PostMapping("/profile/download")
    public String uploadFile(@RequestParam Map map, @RequestParam("fileStatus") String fileStatus, @RequestParam("msg") String msg, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes, HttpServletRequest req, Model model) {
        try {
        	
        	HttpSession session = req.getSession();
        	Object userInfo = session.getAttribute("userId");
        	Map<String, Object> userMap = (Map<String, Object>) userInfo;
        	
        	if(userMap==null) {
    			model.addAttribute("loginStatus",false);
    			return "redirect:/mnhProfileEditFail";
    		} else {
    			model.addAttribute("loginStatus",true);
    		}
        	String userNickname = (String) userMap.get("userNickname");
        	
        	if ("noFile".equals(fileStatus)) {
                // 'noFile' 상태일 때 서비스 메서드 호출
                profileService.addProfileHistory(map, userNickname, msg, "noFile");
            } else {
                // 파일이 있는 경우 파일 처리 후 서비스 메서드 호출
                profileService.download(file);
                profileService.addProfileHistory(map, userNickname, msg, "hasFile");
            }
        	
            return "redirect:/mnhProfileEditSuccess";

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "File upload failed: " + e.getMessage());
            return "redirect:/mnhProfileEditFail";
        }
    }
    
    @RequestMapping("/mnhProfileEditSuccess")
    public String mnhProfileEditSuccess() {
        return "/miniHome/mnhProfileEditSuccess";
    }
    
    @RequestMapping("/mnhProfileEditFail")
    public String mnhProfileEditFail() {
        return "/miniHome/mnhProfileEditFail";
    }
}
