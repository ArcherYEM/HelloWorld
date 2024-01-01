package com.core.tjoeun.index.notice.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.core.tjoeun.index.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value="/notice/noticeView", method = RequestMethod.GET)
	public String noticeView(Model model, @RequestParam Map map) {
		model.addAttribute("list",noticeService.getNoticeList(map));
		model.addAttribute("totalPage",noticeService.getPage());

		return "notice/notice";
	}
	
	@RequestMapping(value="/notice/noticeWrite", method = RequestMethod.GET)
	public String noticeWrite(HttpServletRequest req ,HttpSession session, Model model) {
		
		String direction;
		Map userMap = new HashMap();
		
		if(session == null) {
			model.addAttribute("msg", "권한이 없습니다.");
			direction = "notice/notice";
		}else {
			session = req.getSession();
		    userMap = (Map) session.getAttribute("userId");
		    String userNickname = (String) userMap.get("userNickname");
		    
		    model.addAttribute("userNickname",userNickname);
		    direction = "notice/noticeWrite";
		}
	    
		return direction;
	}
	
	@RequestMapping(value="/notice/write", method = RequestMethod.POST)
	public String write(@RequestParam Map map){
		try {
			noticeService.writeNotice(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "notice/notice";
	}
	
	@RequestMapping(value="/notice/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail() {
		
		return "notice/noticeDetail";
	}
	
	@RequestMapping(value="/notice/noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(Model model, @RequestParam Map map) {
		System.out.println(map.size());
		if(map != null) {
			
			for(int i=0; i<map.size(); i++) {
				System.out.println(map.get(""+i));
			}
		}
		
		model.addAttribute("msg", "삭제되었습니다.");
		
		return "notice/notice";
	}
	
	
}
