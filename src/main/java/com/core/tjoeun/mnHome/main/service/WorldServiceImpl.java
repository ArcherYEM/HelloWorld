package com.core.tjoeun.mnHome.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.tjoeun.mnHome.main.dao.WorldDao;


@Service
public class WorldServiceImpl implements WorldService{

	@Autowired
	WorldDao WorldDao;
}
