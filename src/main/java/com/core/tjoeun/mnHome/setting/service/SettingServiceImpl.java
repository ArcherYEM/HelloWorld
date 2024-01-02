package com.core.tjoeun.mnHome.setting.service;

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
		int result = settingDao.updateAllocationOff(map);
		if (result != 1) {
			throw new Exception();
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public void updateAllocationOn(Map minimiMap) throws Exception {
		int result = settingDao.updateAllocationOn(minimiMap);
		System.out.println("서비스임플 런");
		if (result != 1) {
			System.out.println("서비스임플에서 에러발생");
			System.out.println(result);
			throw new Exception();
		}
		System.out.println(result);
	}
    
}
