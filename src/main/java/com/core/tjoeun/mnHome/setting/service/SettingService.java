package com.core.tjoeun.mnHome.setting.service;

import java.util.List;
import java.util.Map;

public interface SettingService {

	List<Map<String, Object>> selectSettingUserStorage(String userNickname) throws Exception;
}
