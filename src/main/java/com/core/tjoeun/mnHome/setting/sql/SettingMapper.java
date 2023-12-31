package com.core.tjoeun.mnHome.setting.sql;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SettingMapper {
    
    List<Map<String, Object>> selectSettingUserStorage(String userNickname);
    
    public void updateAllocationOff(Map map);

    public void updateAllocationOn(Map minimiMap);
    
    public Map selectSearchUser(Map map);
    
    public int insertFriendRequest(Map map);
    
    public List<HashMap> selectFriends(Map map);
    
    public int updateStatus(Map map);
}
