package com.core.tjoeun.helloworld.minihome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.tjoeun.helloworld.minihome.dao.WorldDao;

@Service
public class WorldServiceImpl implements WorldService{

	@Autowired
	WorldDao worldDao;
	
}
