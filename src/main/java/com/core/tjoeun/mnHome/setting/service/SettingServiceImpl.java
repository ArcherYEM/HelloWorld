package com.core.tjoeun.mnHome.setting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.mnHome.setting.dao.SettingDao;

@Service
@EnableTransactionManagement
public class SettingServiceImpl implements SettingService {

    @Autowired
    SettingDao settingDao;

    @Override
    @Transactional(readOnly = true)
    public List<Map<String, Object>> selectSettingUserStorage(String userNickname) throws Exception {
        return settingDao.selectSettingUserStorage(userNickname);
    }

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public void updateAllocationOff(Map map)  throws Exception{
		settingDao.updateAllocationOff(map);
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public void updateAllocationOn(Map minimiMap) throws Exception {
		settingDao.updateAllocationOn(minimiMap);
		
	}

	@Override
	@Transactional(readOnly = true)
	public Map getSearchUser(Map map) throws Exception {
		
		Map searchMap = new HashMap();
		searchMap = settingDao.selectSearchUser(map);
		if (searchMap == null) {
			throw new Exception();
		}
		
		return searchMap;
	}
    
}
