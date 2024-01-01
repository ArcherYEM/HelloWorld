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
    
}
