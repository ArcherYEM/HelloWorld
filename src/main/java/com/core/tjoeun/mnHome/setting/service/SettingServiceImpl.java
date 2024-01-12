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

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public int insertFriendRequest(Map map) throws Exception {
		int isSuccess = 0;
		
		//기존 신청 내역 확인 
		Map checkMap = new HashMap();
		checkMap.put("checkFriend", 1);
		checkMap.put("userNickname", map.get("requestUser"));
		checkMap.put("name", map.get("responseUser"));
		
		List<HashMap> check =  settingDao.selectFriends(checkMap);
		
		if(check.isEmpty()){
			int result = settingDao.insertFriendRequest(map);
			
			if(result != 1) {
				throw new Exception();
			}else {
				isSuccess = 1;
			}
		}else {
			isSuccess = -1;  // 신청 내역 있음.
		}
		
		return isSuccess;
		
	}

	@Override
	@Transactional(readOnly = true)
	public List<HashMap> selectFriends(Map map) {
		System.out.println("service");
		return settingDao.selectFriends(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public void updateFriends(Map map) throws Exception {
		int result = settingDao.updateStatus(map);
		
		if(result != 1) {
			throw new Exception();
		}
		
	}

	@Override
	@Transactional(readOnly = true)
	public List<Map> selectDotoriUse(String userNickname) {
		return settingDao.selectDotoriUse(userNickname);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Map> selectDotoriCharge(String userNickname) {
		return settingDao.selectDotoriCharge(userNickname);
	}
	
	@Override
	public List<Map<String, Object>> selectSkinMenu(Map map) {
		return settingDao.selectSkinMenu(map);
	}

	@Override
	public List<Map<String, Object>> allocationOnSkinMenu(Map map) {
		return settingDao.allocationOnSkinMenu(map);
	}
    
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public int changeName(Map map) throws Exception {
		int result = settingDao.changeName(map);
		
		if(result != 1) {
			throw new Exception();
		}
		return result;		
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public int changeNickname(Map map) throws Exception {
		int result = settingDao.changeNickname(map);
		
		if(result != 1) {
			throw new Exception();
		}
		return result;		
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	public int changeNumber(Map map) throws Exception {
		int result = settingDao.changeNumber(map);
		
		if(result != 1) {
			throw new Exception();
		}
		return result;		
	}

	@Override
	public List<Map> selectMyBgm(Map map) {
		return settingDao.selectMyBgm(map);
	}

	@Override
	public int addPlayList(Map param) {
		return settingDao.addPlayList(param);
	}
	
	@Override
	public int removePlayList(Map param) {
		return settingDao.removePlayList(param);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Map> selectPlayList(String userNickname) {
		return settingDao.selectPlayList(userNickname);
	}
}
