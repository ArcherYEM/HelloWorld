package com.core.tjoeun.mnHome.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
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
		if(profile == null||profile.isEmpty()) {
			profile = new HashMap<>();
            profile.put("image", defaultImagePath);
            profile.put("msg", "");
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
	public List<Map> getMinimi() {
		
		return mainDao.getMinimi();
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
	
	@Value("${default.minimi.path}")
    private String defaultMinimi;
	
	@Value("${default.background.path}")
    private String defaultBackground;

	@Override
	@Transactional(readOnly = true)
	public Map selectBackground(String userNickname) {
		
		return mainDao.selectBackground(userNickname);
	}
	
}
