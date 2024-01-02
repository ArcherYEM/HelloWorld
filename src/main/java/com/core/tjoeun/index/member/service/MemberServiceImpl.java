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
import com.core.tjoeun.util.SHA256;

@Service
@EnableTransactionManagement
public class MemberServiceImpl implements MemberService{

   @Autowired
   MemberDao memberDao;
   
   @Override
   @Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
   public void signUp(Map map) throws Exception {
     map.put("userPassword", SHA256.encryptSHA256((String) map.get("userPassword")));
      int result = memberDao.insertUserInfo(map);
      if (result != 1) {
         throw new Exception();
      }
   }

   @Override
   @Transactional(readOnly = true)
   public Map login(Map map) throws Exception {
       map.put("userPassword", SHA256.encryptSHA256((String) map.get("userPassword")));
        Map selectMap = memberDao.selectUserInfo(map);

        if (selectMap != null &&
                map.get("userEmail").equals(selectMap.get("userEmail")) &&
                map.get("userPassword").equals(selectMap.get("userPassword"))) {
           System.out.println(SHA256.encryptSHA256((String) map.get("userPassword")));
           System.out.println((String)selectMap.get("userPassword"));
           System.out.println();
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
    public void logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
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
}