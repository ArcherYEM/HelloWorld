package com.core.tjoeun.mnHome.profile.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public String uploadFile(@RequestParam Map map, @RequestParam("msg") String msg, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes, HttpServletRequest req) {
        try {
        	
        	HttpSession session = req.getSession();
        	Object userInfo = session.getAttribute("userId");
        	Map<String, Object> userMap = (Map<String, Object>) userInfo;
        	String userNickname = (String) userMap.get("userNickname");
        	
            profileService.download(file);
            profileService.addProfileHistory(map, userNickname,msg);
            redirectAttributes.addFlashAttribute("message", "File uploaded successfully: " + file.getOriginalFilename());
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
