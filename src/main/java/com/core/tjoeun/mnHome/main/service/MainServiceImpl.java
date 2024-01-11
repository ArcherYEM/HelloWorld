
package com.core.tjoeun.mnHome.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.index.member.service.MemberService;
import com.core.tjoeun.mnHome.main.dao.MainDao;

@Service
@EnableTransactionManagement
public class MainServiceImpl implements MainService{

	@Autowired
	MainDao mainDao;
	
	@Autowired
	MemberService memberService;
	

	@Value("${default.image.path}")
    private String defaultImagePath;
	
	@Override
	@Transactional(readOnly = true)
	public Map getProfile(String userNickname) {
	 Map profile = mainDao.getProfile(userNickname);
	 
	 if(null != profile) {
		
		 String image = (String) profile.get("image");
		 String msg = (String) profile.get("msg");
		 
		 System.out.println("테스트:"+profile);
		 
		 if(image.equals("noneFile")&&(!msg.equals("")||(msg!=null))) {
			 profile = mainDao.getProfileNoImg(userNickname);
		 }
		 else if(!image.equals("noneFile")&&((msg.equals(""))||(msg==null))) {	 		
			 profile = mainDao.getProfileNoMsg(userNickname); 
		 } 
	 }
	 	return profile;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Map> getProfileHistory(String userNickname) {
		
		return mainDao.getProfileHistory(userNickname);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Map> getMinimi(String userNickname) {
		
		return mainDao.getMinimi(userNickname);
	}

	@Override
	public void resetMinimi(String userNickname) {
		
		mainDao.resetMinimi(userNickname);		
	}

	@Override
	public void insertMinimi(Map<String, Object> minimiData) {
		
		mainDao.insertMinimi(minimiData);		
	}
	
	@Override
	public void resetBackground(String userNickname) {
		
		mainDao.resetBackground(userNickname);		
	}
	
	@Override
	public void upsertBackground(Map<String, Object> params) {
		
		mainDao.upsertBackground(params);		
	}

	@Override
	@Transactional(readOnly = true)
	public List<Map> selectMinimi(String userNickname) {
		
		return mainDao.selectMinimi(userNickname);
	}

	@Override
	@Transactional(readOnly = true)
	public Map selectBackground(String userNickname) {
		
		return mainDao.selectBackground(userNickname);
	}

	@Override
	@Transactional(readOnly = true)
	public Map getHomeTitle(String userNickname) {
		
		return mainDao.selectHomeTitle(userNickname);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = {Exception.class})
	public void updateHomeTitle(Map map) throws Exception {
		Map titleExist = mainDao.selectHomeTitle((String) map.get("userNickname"));
		int result;
		
		if(titleExist != null) {
			result = mainDao.updateHomeTitle(map);

		}else {
			result = mainDao.insertHomeTitle(map);
		}
		
		if(result != 1) {
			throw new Exception();
		}
		
		
	}

	@Override
	public Map getUserInfo(String userNickname) {
		Map map = new HashMap();
		map.put("userNickname", userNickname);
		
		//홈피 주인 이름 가져오기 
		String userName = memberService.getUserName(userNickname);
		map.put("userName", userName);
		map.put("del_yn", "n");
		map.put("openScope", 1);
		
		//Home Title
		Map title = getHomeTitle(userNickname);
		if(title != null) {
			map.put("title", title.get("title"));
		}else {
			map.put("title", userName + "의 미니홈피입니다.");
		}
		return map;
	}
	
	@Override
	@Transactional(readOnly = true)
	public Map selectAllTab(String userNickname) {
		
		return mainDao.selectAllTab(userNickname);
	}

	@Override
	@Transactional(readOnly = true)
	public Map selectNewTab(String userNickname) {
		
		return mainDao.selectNewTab(userNickname);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Map> getMyFriends(String userNickname) {
		
		return mainDao.getMyFriends(userNickname);
	}

	@Override
	public Map mainSkin(Map map) {
		
		return mainDao.mainSkin(map);
	}
	
	@Override
	public Map mainMenu(Map map) {
		
		return mainDao.mainMenu(map);
	}
	
}
