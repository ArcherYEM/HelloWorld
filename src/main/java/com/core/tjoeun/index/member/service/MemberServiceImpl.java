package com.core.tjoeun.index.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.index.member.dao.MemberDao;
import com.core.tjoeun.mnHome.main.dao.MainDao;
import com.core.tjoeun.util.SHA256;

@Service
@EnableTransactionManagement
public class MemberServiceImpl implements MemberService{

   @Autowired
   MemberDao memberDao;
   
   @Autowired
   MainDao mainDao;
   
   @Override
   @Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
   public void signUp(Map map) throws Exception {
     map.put("userPassword", SHA256.encryptSHA256((String) map.get("userPassword")));
      int result = memberDao.insertUserInfo(map);
      String userNickname = (String) map.get("userNickname");
     
      
      if(result == 1) {
    	  	 Map signUpmap = new HashMap();
    	  	 signUpmap.put("userNickname", userNickname);
    	  	 signUpmap.put("dotoriChargeMethod", "회원가입 축하 포인트");
    	  	 signUpmap.put("dotoriPrice", "0");
    	  	 
	   		 memberDao.insertUserDotori(userNickname);
	   		 memberDao.insertUserDotoriC(signUpmap);
	   		 memberDao.insertMiniroomBackground(userNickname);
	   		 memberDao.insertMiniroomMinimi(userNickname);
	   		 memberDao.insertMinihomeTitle(userNickname);
	   		 memberDao.insertUserProfile(userNickname);
	   		 memberDao.insertUserStorage(userNickname);
	   		 memberDao.insertLoginStatus(userNickname);
	   		 memberDao.insertUserStorageSkin(userNickname);
	   		 memberDao.insertUserStorageMenu(userNickname);
	   		 memberDao.insertVisitCnt(userNickname);
	   		
     }
      if (result != 1) {
         throw new Exception();
      }
   }

   @Override
   @Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
   public Map login(Map map) throws Exception {
       map.put("userPassword", SHA256.encryptSHA256((String) map.get("userPassword")));
        Map selectMap = memberDao.selectUserInfo(map);

        if (selectMap != null &&
                map.get("userEmail").equals(selectMap.get("userEmail")) &&
                map.get("userPassword").equals(selectMap.get("userPassword"))) {
           
           
           memberDao.insertLoginLog((String) selectMap.get("userNickname"));
           memberDao.loginOnStatus((String) selectMap.get("userNickname"));
           
           selectMap.put("friendCnt", memberDao.selectOnFriendCnt((String) selectMap.get("userNickname"))) ;
           
           
           // 로그인 성공 시, 사용자 정보 반환
            return selectMap;
        } else {
            // 로그인 실패 시, null 반환
            return null;
        }
    }

   @Override
   @Transactional(readOnly = true)
   public Map selectEmail(Map map) {
      Map emailMap = new HashMap();
      emailMap = memberDao.selectUserInfo(map);
      return emailMap;
   }

   @Override
   @Transactional(readOnly = true)
   public Map selectPhone(Map map) {
      Map phoneMap = new HashMap();
      phoneMap = memberDao.selectUserInfo(map);
      return phoneMap;
   }
   
    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
    public void logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    	
    	memberDao.loginOffStatus((String) session.getAttribute("userNickname"));
    	
    	session.invalidate();
        
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        handleLogoutResponse(response);
    }

    private void handleLogoutResponse(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
    }

    
   @Override
   @Transactional(readOnly = true)
   public Map findId(Map map) {
      return memberDao.selectUserId(map);
   }

   
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public void updatePw(Map map) throws Exception {
		map.put("newPw", SHA256.encryptSHA256((String) map.get("newPw")));
	    int result = memberDao.updatePw(map);
	    if (result != 1) {
	       throw new Exception();
	    }
		
	}

	@Override
	@Transactional(readOnly = true)
	public String selectUserMinimi(String userNickname) {
		return memberDao.selectUserMinimi(userNickname);
	}
	
	@Override
	@Transactional(readOnly = true)
	public String getUserName(String userNickname) {
		return memberDao.selectUserName(userNickname);
	}

	@Override
	@Transactional(readOnly = true)
	public int selectRequest(String userNickname) {
		return memberDao.selectRequest(userNickname);
	}
	
	@Override
	@Transactional(readOnly = true)
	public String selectUserGender(String userNickname) {
		return memberDao.selectUserGender(userNickname);
	}

	@Override
	@Transactional(readOnly = true)
	public int selectNewContent(String userNickname) {
		// ###Tabs :{TotalBoardCount=2, TotalVisitCount=0, RecentDiaryCount=1, RecentBoardCount=2, RecentAlbumCount=1, TotalAlbumCount=1, TotalDiaryCount=1, RecentVisitCount=0}
        //다이어리, 앨범, 게시판, 방명록 전체 개수 및 최근 24시간 개수 가져오기
  		Map tabs = mainDao.tabs(userNickname);
  		int recentContents = 0;
  		if(tabs != null) {
  			recentContents += Integer.parseInt(String.valueOf(tabs.get("RecentDiaryCount")));
  			recentContents += Integer.parseInt(String.valueOf(tabs.get("RecentBoardCount")));
  			recentContents += Integer.parseInt(String.valueOf(tabs.get("RecentAlbumCount")));
  			recentContents += Integer.parseInt(String.valueOf(tabs.get("RecentVisitCount")));
  		}
  		return recentContents;
	}

	@Override
	@Transactional(readOnly = true)
	public String getFriendCount(String userNickname) {
		Map resultMap = memberDao.getFriendCount(userNickname);
		
		return (String.valueOf(resultMap.get("totalCount")));
	}
	
	@Override
	@Transactional(readOnly = true)
	public String getTodayVisit(String userNickname) {
		Map resultMap = mainDao.selectVisitCnt(userNickname);
		return (String.valueOf(resultMap.get("todayCnt")));
	}
	
	@Override
	@Transactional(readOnly = true)
	public String getOnFriendCnt(String userNickname) {
		Map resultMap = memberDao.selectOnFriendCnt(userNickname);
		return (String.valueOf(resultMap.get("count")));
	}


}