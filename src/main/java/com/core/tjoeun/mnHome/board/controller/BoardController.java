package com.core.tjoeun.mnHome.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.tjoeun.mnHome.board.service.BoardService;
import com.core.tjoeun.mnHome.main.dao.MainDao;
import com.core.tjoeun.mnHome.main.service.MainService;

@Controller
public class BoardController {
	
	@Autowired
	MainService mainService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	MainDao mainDao;
	
	@RequestMapping(value={"/mnHome/boardView/{userNickname}","/mnHome/boardView/{userNickname}/{page}"})
	public String boardView(@PathVariable String userNickname, @PathVariable Optional<String> page, Model model) {
		
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		Map selectMap = new HashMap();
		selectMap.put("userNickname", userNickname);
		if(page.isPresent()) {
			selectMap.put("page", page.get());			
		}
		model.addAttribute("list",boardService.getBoardList(selectMap));
		model.addAttribute("totalPage", boardService.getBoardPage(selectMap));
		
        //접속중인 유저의 친구 전부 가져오기
        List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);
        
     // menu color 적용하기
        Map callMenu = new HashMap();
        callMenu.put("category", "menu");
        callMenu.put("userNickname", userNickname);
        System.out.println("### callMenu : " + callMenu);
        
        try {
        	Map mainMenu = mainService.mainMenu(callMenu);
        	System.out.println("### mainMenu : " + mainMenu);
        	
        	model.addAttribute("menuProductName", mainMenu.get("productName"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));
	        System.out.println("### menu model : " + model);
	        
        } catch (NullPointerException n) {
	        	model.addAttribute("menuProductName", "rgb(42, 140, 168)");
	        	model.addAttribute("menuCategory", "menu");
	        	n.printStackTrace();
        }
		
      //방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		return "miniHome/board";
	}
	
	
	@RequestMapping(value="/mnHome/boardWriteView/{userNickname}")
	public String boardWriteView(@PathVariable String userNickname, Model model) {
		
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
        //접속중인 유저의 친구 전부 가져오기
        List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);
        
     // menu color 적용하기
        Map callMenu = new HashMap();
        callMenu.put("category", "menu");
        callMenu.put("userNickname", userNickname);
        System.out.println("### callMenu : " + callMenu);
        
        try {
        	Map mainMenu = mainService.mainMenu(callMenu);
        	System.out.println("### mainMenu : " + mainMenu);
        	
        	model.addAttribute("menuProductName", mainMenu.get("productName"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));
	        System.out.println("### menu model : " + model);
	        
        } catch (NullPointerException n) {
	        	model.addAttribute("menuProductName", "rgb(42, 140, 168)");
	        	model.addAttribute("menuCategory", "menu");
	        	n.printStackTrace();
        }
		
      //방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		return "miniHome/boardWrite";
	}
	
	@RequestMapping(value="/mnHome/boardWrite")
	@ResponseBody
	public Map boardWrite(@RequestBody Map map, Model model, HttpSession session) {
		Map result = new HashMap<String, String>();
		try {
			boardService.writeBoard(map);
			result.put("resultCode", "1");
		} catch (Exception e) {
			result.put("resultCode", "0");
			e.printStackTrace();
		}
		
		//방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt((String) session.getAttribute("userNickname"));
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/mnHome/boardDetail/{userNickname}/{seq}")
	public String boardDetail(@PathVariable String userNickname, @PathVariable String seq, Model model, HttpSession session, HttpServletRequest req) {
		
		Map profile = mainService.getProfile(userNickname);
		String image = (String) profile.get("image");
		String msg = (String) profile.get("msg");
		msg = msg.replace("\n", "<br>");
		model.addAttribute("image", image);
		model.addAttribute("msg", msg);
		
		Map map = mainService.getUserInfo(userNickname);
		model.addAttribute("userName", map.get("userName"));
		model.addAttribute("title", map.get("title"));
		
		
		Map selectMap = new HashMap();
		selectMap.put("userNickname", userNickname);
		selectMap.put("seq", seq);
		model.addAttribute("list",boardService.getBoardList(selectMap));
		model.addAttribute("seq",seq);
		
        //접속중인 유저의 친구 전부 가져오기
        List<Map> friendMap = mainService.getMyFriends(userNickname);
        model.addAttribute("friend", friendMap);

        //현재 접속중인 유저가 방문한 페이지의 주인과 친구인지 체크
        Map userMap = new HashMap();
        session = req.getSession();
		userMap = (Map) session.getAttribute("userId");
		String Nickname = (String) userMap.get("userNickname");
        
		int friend;
        Map checkMap = new HashMap();
        checkMap.put("userNickname",Nickname );
        checkMap.put("friendNickname", userNickname); 
        friend = boardService.checkFriend(checkMap);
        if(Nickname.equals(userNickname)) {
        	friend=1;
        }
        model.addAttribute("check",friend);
        
     //댓글 불러오기
        int boardSeq = Integer.parseInt(seq);
        List<Map> commentMap = boardService.getBoardComment(boardSeq);
        model.addAttribute("comment",commentMap);

     // menu color 적용하기
        Map callMenu = new HashMap();
        callMenu.put("category", "menu");
        callMenu.put("userNickname", userNickname);
        System.out.println("### callMenu : " + callMenu);
        
        try {
        	Map mainMenu = mainService.mainMenu(callMenu);
        	System.out.println("### mainMenu : " + mainMenu);
        	
        	model.addAttribute("menuProductName", mainMenu.get("productName"));
	        model.addAttribute("menuCategory", mainMenu.get("category"));
	        model.addAttribute("menuUserNickname", mainMenu.get("userNickname"));
	        System.out.println("### menu model : " + model);
	        
        } catch (NullPointerException n) {
	        	model.addAttribute("menuProductName", "rgb(42, 140, 168)");
	        	model.addAttribute("menuCategory", "menu");
	        	n.printStackTrace();
        }
        
      //방문자 수 가져오기
        try {
			Map visitCntMap = new HashMap();
			visitCntMap = mainDao.selectVisitCnt(userNickname);
			model.addAttribute("todayCnt", (int) visitCntMap.get("todayCnt"));
			model.addAttribute("totalCnt", (int) visitCntMap.get("totalCnt"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		return "miniHome/boardDetail";
	}
	
	@RequestMapping(value="/mnHome/boardDelete")
	@ResponseBody
	public Map boardDelete(@RequestBody ArrayList<String> seq, Model model,HttpSession session) {
		Map result = new HashMap<String, String>();
		
		try {
			boardService.deleteBoard(seq);
			result.put("resultCode", "1");
		} catch (Exception e) {
			result.put("resultCode", "0");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@RequestMapping(value="smarteditorMultiImageUpload")
	public void smarteditorMultiImageUpload(HttpServletRequest request, HttpServletResponse response){
		try {
			//파일정보
			String sFileInfo = "";
			//파일명을 받는다 - 일반 원본파일명
			String sFilename = request.getHeader("file-name");
			//파일 확장자
			String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".")+1);
			//확장자를소문자로 변경
			sFilenameExt = sFilenameExt.toLowerCase();
				
			//이미지 검증 배열변수
			String[] allowFileArr = {"jpg","png","bmp","gif"};

			//확장자 체크
			int nCnt = 0;
			for(int i=0; i<allowFileArr.length; i++) {
				if(sFilenameExt.equals(allowFileArr[i])){
					nCnt++;
				}
			}

			//이미지가 아니라면
			if(nCnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_"+sFilename);
				print.flush();
				print.close();
			} else {
				String sRealFileNm = "";
				// 서버의 호스트 이름과 프로토콜 설정
				String serverHost = "http:/localhost";  // 실제 서버의 호스트 이름으로 바꾸세요.

				// 서버 내에서 이미지가 저장된 상대 경로
				String imageRelativePath = "./src/main/resources/images/";  // 실제 이미지가 저장된 서버 상의 상대 경로로 바꾸세요.

				// 완전한 이미지 URL 생성
				String sFileURL = serverHost + imageRelativePath + sRealFileNm;
				
				//파일경로
				String filePath = "./src/main/resources/images/";
				File file = new File(filePath);
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				sRealFileNm = today+UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
				String rlFileNm = filePath + sRealFileNm;
				
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream inputStream = request.getInputStream();
				OutputStream outputStream=new FileOutputStream(rlFileNm);
				int numRead;
				byte bytes[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = inputStream.read(bytes,0,bytes.length)) != -1){
					outputStream.write(bytes,0,numRead);
				}
				if(inputStream != null) {
					inputStream.close();
				}
				outputStream.flush();
				outputStream.close();
				
				///////////////// 이미지 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ sFilename;
				sFileInfo += "&sFileURL=" + sFileURL;
				PrintWriter printWriter = response.getWriter();
				printWriter.print(sFileInfo);
				printWriter.flush();
				printWriter.close();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/mnHome/addComment", method = RequestMethod.POST)
	@ResponseBody
	public List<Map> addComment(@RequestBody Map<String, String> requestData) {
		List<Map> commentMap = new ArrayList();
		
		try {
			int result = boardService.insertBoardComment(requestData);
			if (result==1){
				int boardSeq = Integer.parseInt(requestData.get("boardSeq"));
				commentMap = boardService.getBoardComment(boardSeq);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return commentMap;
	}
	
	@RequestMapping(value = "/mnHome/deleteComment", method = RequestMethod.POST)
	@ResponseBody
	public int deleteComment(@RequestParam("seq") int seq) {
		
		int result=boardService.deleteBoardComment(seq);

		return result;
	}
}