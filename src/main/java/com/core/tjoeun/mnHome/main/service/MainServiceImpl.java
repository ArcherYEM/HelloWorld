
package com.core.tjoeun.mnHome.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
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
	@Cacheable(key="#userNickname", value="bgmList")
	public List<Map> getMyBgm(String userNickname) {
		
		return mainDao.getMyBgm(userNickname);
	}
	
	//미니홈피 방문자 수 가져오기
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = {Exception.class})
	public Map updateVisitCnt(String userNickname) throws Exception {
		Map visitCntMap = new HashMap();
		int result = 0;
		
		visitCntMap = mainDao.selectVisitCnt(userNickname);
		if(visitCntMap != null) {
			int today = (int) visitCntMap.get("todayCnt") + 1 ;
			int total = (int) visitCntMap.get("totalCnt") + 1 ;
			
			Map updateVisitCntMap = new HashMap();
			updateVisitCntMap.put("userNickname", userNickname);
			updateVisitCntMap.put("todayCnt", today);
			updateVisitCntMap.put("totalCnt", total);
			
			result = mainDao.updateVisitCnt(updateVisitCntMap);
			if(result != 0) {
				return updateVisitCntMap;
			} else {
				throw new Exception();
			}
		} else {
			throw new Exception();
		}
	}
	
	//프로필 정보 가져오기	
	@Override
	@Transactional(readOnly = true)
	@Cacheable(key="#userNickname", value="profile")
	public Map getProfile(String userNickname) {
	 Map profile = mainDao.getProfile(userNickname);
	 
	 if(null != profile) {
		
		 String image = (String) profile.get("image");
		 String msg = (String) profile.get("msg");
		 
		 if(image.equals("noneFile")&&(!msg.equals("")||(msg!=null))) {
			 profile = mainDao.getProfileNoImg(userNickname);
		 }
		 else if(!image.equals("noneFile")&&((msg.equals(""))||(msg==null))) {	 		
			 profile = mainDao.getProfileNoMsg(userNickname); 
		 } 
	 }
	 	return profile;
	}
	
	//기본정보 가져오기(이름,성별,제목)
	@Override
	@Transactional(readOnly = true)
	@Cacheable(key="#userNickname", value="userInfo")
	public Map selectUserInfo(String userNickname) {
		
		return mainDao.selectUserInfo(userNickname);
	}
	
	//접속중인 유저의 친구 전부 가져오기
	@Override
	@Transactional(readOnly = true)
	public List<Map> getMyFriends(String userNickname) {
		
		return mainDao.getMyFriends(userNickname);
	}
	
	@Override
	@Transactional(readOnly = true)
	public int friendCheck(Map map) {
		
		return mainDao.friendCheck(map);
	}
	
	//미니홈피 제목 가져오기
	@Override
	@Transactional(readOnly = true)
	@Cacheable(key="#userNickname", value="homeTitle")
	public Map getHomeTitle(String userNickname) {
		
		return mainDao.selectHomeTitle(userNickname);
	}
	
	//다이어리, 앨범, 게시판, 방명록 전체 개수 및 최근 24시간 개수 가져오기
	@Override
	@Transactional(readOnly = true)
	public Map tabs(String userNickname) {
		
		return mainDao.tabs(userNickname);
	}
	
	//게시판, 사진첩 최신 게시글 상위 4개 가져오기
	@Override
	@Transactional(readOnly = true)
	public List<Map> selectCurrentContent(String userNickname) {
		
		return mainDao.selectCurrentContent(userNickname);
	}
	
	//홈피 주인 이름 가져오기 
	@Override
	@Transactional(readOnly = true)
	@Cacheable(key="#userNickname", value="userName")
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
	@Cacheable(key="#userNickname", value="minimi")
	public List<Map> selectMinimi(String userNickname) {
		
		return mainDao.selectMinimi(userNickname);
	}

	@Override
	@Transactional(readOnly = true)
	@Cacheable(key="#userNickname", value="background")
	public Map selectBackground(String userNickname) {
		
		return mainDao.selectBackground(userNickname);
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
	@Cacheable(key="#map['userNickname']", value="skin")
	public Map mainSkin(Map map) {
		
		return mainDao.mainSkin(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = {Exception.class})
	public int insertFriendCmt(Map map) throws Exception {
		int result = mainDao.insertFriendCmt(map);
		
		if(result != 1) {
			throw new Exception();
		} else {
			return result;
		}
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Map> selectFriendCmt(Map map) throws Exception {
		List<Map> friendCmtListMap = new ArrayList<Map>();
		friendCmtListMap = mainDao.selectFriendCmt(map);
		
		if(friendCmtListMap == null) {
			throw new Exception();
		} else {
			return friendCmtListMap;
		}
	}

	@Override
	@Cacheable(key="#map['userNickname']", value="menu")
	public Map mainMenu(Map map) {
		
		return mainDao.mainMenu(map);
	}

	


}
