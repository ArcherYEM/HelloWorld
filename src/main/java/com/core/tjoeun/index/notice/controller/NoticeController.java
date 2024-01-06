package com.core.tjoeun.index.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			direction = "redirect:/notice/noticeView";
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
		return "redirect:/notice/noticeView";
	}
	
	
	@RequestMapping(value="/notice/modifyView", method = RequestMethod.POST)
	public String modifyView(Model model, @RequestParam Map map){
		
		model.addAttribute("seq", map.get("seq"));
		model.addAttribute("title", map.get("title"));
		model.addAttribute("writer", map.get("writer"));
		model.addAttribute("date", map.get("date"));
		model.addAttribute("content", map.get("content"));
		
		return "/notice/noticeModify";
	}
	
	
	@RequestMapping(value="/notice/modify", method = RequestMethod.POST)
	public String modify(@RequestParam Map map, RedirectAttributes re){
		try {
			String content = (String) map.get("content");
			map.replace("content", content.replace("\r\n", ""));
			
			noticeService.modifyNotice(map);
			re.addFlashAttribute("msg", "적용되었습니다 .");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/notice/noticeDetail?seq=" + map.get("seq");
	}
	
	
	@RequestMapping(value="/notice/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(Model model, @RequestParam Map map) {
		List tempList = noticeService.getNoticeList(map);
		
		String content = ((String) ((Map) tempList.get(0)).get("content")).replace("\r\n", "");
		
		
		model.addAttribute("list",tempList);
		
		return "notice/noticeDetail";
	}
	
	@RequestMapping(value="/notice/noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(Model model, @RequestParam Map map, RedirectAttributes re) {

		ArrayList<String> keyList = new ArrayList<String>(map.keySet());
		ArrayList<String> seq = new ArrayList<String>();
		
		
		if(keyList.size() > 0) {
			try {
				for(int i=0; i<keyList.size(); i++) {
					seq.add(i, (String) map.get(keyList.get(i)));
				}
				noticeService.deleteNotice(seq);
				re.addFlashAttribute("msg", "삭제되었습니다.");
				
			} catch (Exception e) {
				e.printStackTrace();
				re.addFlashAttribute("msg", "잠시 후 다시 시도해주세요.");
			}
		}else {
			re.addFlashAttribute("msg", "삭제할 게시물을 선택해주세요.");
		}
		
		return "redirect:/notice/noticeView";
	}
	
	@RequestMapping(value="/error", method = RequestMethod.GET)
	public String error() {
		
		return "index/error";
	}
	
}
