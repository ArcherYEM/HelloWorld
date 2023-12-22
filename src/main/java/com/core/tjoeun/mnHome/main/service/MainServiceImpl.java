package com.core.tjoeun.mnHome.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.tjoeun.mnHome.main.dao.MainDao;


@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDao mainDao;
}
