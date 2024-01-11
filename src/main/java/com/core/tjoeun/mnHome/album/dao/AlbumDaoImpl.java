package com.core.tjoeun.mnHome.album.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.core.tjoeun.mnHome.album.sql.AlbumMapper;

@Repository
public class AlbumDaoImpl implements AlbumDao{

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public int insertAlbum(Map map) {
		AlbumMapper albumMapper = sqlsession.getMapper(AlbumMapper.class);
		return albumMapper.insertAlbum(map);
	}
	
	@Override
	public List<HashMap> selectAlbum(Map map) {
		AlbumMapper albumMapper = sqlsession.getMapper(AlbumMapper.class);
		return albumMapper.selectAlbum(map);
	}

}
