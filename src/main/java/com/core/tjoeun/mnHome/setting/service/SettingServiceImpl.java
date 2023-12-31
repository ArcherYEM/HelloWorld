package com.core.tjoeun.mnHome.setting.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.mnHome.setting.dao.SettingDao;

@Service
@EnableTransactionManagement
public class SettingServiceImpl implements SettingService {

    @Autowired
    SettingDao settingDao;

    @Override
    @Transactional(readOnly = true)
    public Map selectSettingUserStorage(Map map) throws Exception {
        return settingDao.selectSettingUserStorage(map);
    }
    
    @Override
    @Transactional(readOnly = true)
    public String getContentPath(Map map) throws Exception {
        return settingDao.getContentPath(map);
    }
}
