package com.core.tjoeun.mnHome.setting.service;

import java.util.Map;

public interface SettingService {

    Map selectSettingUserStorage(Map map) throws Exception;
    
    String getContentPath(Map map) throws Exception;
}
