package com.core.tjoeun.mnHome.setting.dao;

import java.util.List;
import java.util.Map;

public interface SettingDao {

	List<Map<String, Object>> selectSettingUserStorage(String userNickname);
}
