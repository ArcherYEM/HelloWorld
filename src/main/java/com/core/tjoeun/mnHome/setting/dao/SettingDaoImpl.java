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
	
	@Override
	public List<Map> selectDotoriUse(String userNickname) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.selectDotoriUse(userNickname);
	}
	
	@Override
	public List<Map> selectDotoriCharge(String userNickname) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.selectDotoriCharge(userNickname);
	}
	
	@Override
	public List<Map<String, Object>> selectSkinMenu(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.selectSkinMenu(map);
	}

	@Override
	public List<Map<String, Object>> allocationOnSkinMenu(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.allocationOnSkinMenu(map);
	}

	@Override
	public int changeName(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.changeName (map);
	}
	
	@Override
	public int changeNickname(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.changeNickname (map);
	}

	@Override
	public int changeNumber(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.changeNumber (map);
	}

	@Override
	public List<Map> selectMyBgm(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.selectMyBgm(map);
	}
    
}
