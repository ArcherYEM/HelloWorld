package com.core.tjoeun.util;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.tjoeun.index.member.dao.MemberDao;

@Service
public class SessionListener implements HttpSessionListener {

	@Autowired
	MemberDao memberDao;
	
	@Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // 세션이 만료되거나 소멸될 때 DB 업데이트 (로그아웃 상태로 변경)
        HttpSession session = se.getSession();
        String userNickname = (String) session.getAttribute("userNickname");

        if (userNickname != null) {
            memberDao.loginOffStatus(userNickname);
        }
    }

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	
	
}
