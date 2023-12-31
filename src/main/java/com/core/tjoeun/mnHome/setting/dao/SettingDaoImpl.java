package com.core.tjoeun.mnHome.setting.dao;

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
    public Map selectSettingUserStorage(Map map) {
        SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
        return mapper.selectSettingUserStorage(map);
    }
    
    @Override
    public String getContentPath(Map map) throws Exception {
        SettingMapper mapper = sqlSession.getMapper(SettingMapper.class);
        return mapper.getContentPath(map);
    }
}
