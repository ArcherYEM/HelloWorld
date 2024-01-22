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
    
    public List<Map> selectDotoriUse(String userNickname);
    
    public List<Map> selectDotoriCharge(String userNickname);

    public List<Map<String, Object>> selectSkinMenu(Map map);
    
    public List<Map<String, Object>> allocationOnSkinMenu(Map map);
    
    public int changeName (Map map);

    public int changeNickname (Map map);
    
    public int changeNumber (Map map);
    
    public List<Map> selectMyBgm(Map map);
    
    public int addPlayList(Map param);
    
    public int removePlayList(Map param);
    
    public List<Map> selectPlayList(String userNickname);
    
    public String selectPhone(String userNickname);
}
