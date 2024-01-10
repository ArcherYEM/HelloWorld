package com.core.tjoeun.mnHome.album.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.mnHome.album.dao.AlbumDao;

@Service
@EnableTransactionManagement
public class AlbumServiceImpl implements AlbumService{

	@Autowired
	AlbumDao albumDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void insertAlbum(Map map) throws Exception{
		int result = albumDao.insertAlbum(map);
		
		if(result != 1) {
			throw new Exception();
		}
	}
	
}
