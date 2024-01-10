package com.core.tjoeun.mnHome.diary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.mnHome.diary.dao.DiaryDao;

@Service
@EnableTransactionManagement
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	DiaryDao diaryDao;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public Map insertDiary(Map map) throws Exception {
		int result = diaryDao.insertDiary(map);
		
		if (1 != result) {
			throw new Exception();
		}
		return map;
	}

	@Override
	public Map selectDiary(Map map) {
		
		return diaryDao.selectDiary(map);
	}

	@Override
	public int deleteDiary(ArrayList<String> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyDiary(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
