package com.core.tjoeun.mnHome.setting.dao;

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
	public int updateAllocationOff(Map map) {
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		return mapper.updateAllocationOff(map);
	}

	@Override
	public int updateAllocationOn(Map minimiMap) {
		System.out.println("다오 런");
		SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
		System.out.println("다오에서 에서 mapper 불렀음");
		return mapper.updateAllocationOff(minimiMap);
	}
    
}
