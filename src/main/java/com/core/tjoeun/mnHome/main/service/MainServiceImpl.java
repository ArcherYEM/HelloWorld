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

import com.core.tjoeun.mnHome.main.dao.MainDao;

@Service
@EnableTransactionManagement
public class MainServiceImpl implements MainService{

	@Autowired
	MainDao mainDao;

	@Value("${default.image.path}")
    private String defaultImagePath;
	
	@Override
	@Transactional(readOnly = true)
	public Map getProfile(String userNickname) {
	 Map profile = mainDao.getProfile(userNickname);
	 String image = (String) profile.get("image");
	 String msg = (String) profile.get("msg");
	 
	 	System.out.println("테스트:"+profile);
	 
	 	if(image.equals("noneFile")&&(!msg.equals("")||(msg!=null))) {
	 		Map profile1 = new HashMap();
	 		profile1 =mainDao.getProfileNoImg(userNickname);
	 		System.out.println("프로필:"+profile1);
	 		
	 	}
	 	else if(!image.equals("noneFile")&&((msg.equals(""))||(msg==null))) {
	 		profile =mainDao.getProfileNoMsg(userNickname);
	 		System.out.println("프로필:"+profile);
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
	
}
