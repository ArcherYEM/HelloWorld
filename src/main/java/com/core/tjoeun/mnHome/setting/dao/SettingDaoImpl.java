package com.core.tjoeun.mnHome.setting.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.mnHome.setting.sql.SettingMapper;

@Repository
public class SettingDaoImpl implements SettingDao {

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<Map<String, Object>> selectSettingUserStorage(String userNickname) {
        SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
        return mapper.selectSettingUserStorage(userNickname);
    }

	@Override
	public void updateAllocationOff(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		mapper.updateAllocationOff(map);
	}

	@Override
	public void updateAllocationOn(Map minimiMap) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		mapper.updateAllocationOn(minimiMap);
	}

	@Override
	public Map selectSearchUser(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.selectSearchUser(map);
	}

	@Override
	public int insertFriendRequest(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.insertFriendRequest(map);
	}

	@Override
	public List<HashMap> selectFriends(Map map) {
		System.out.println("dao");
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.selectFriends(map);
	}

	@Override
	public int updateStatus(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.updateStatus(map);
	}
    
}
