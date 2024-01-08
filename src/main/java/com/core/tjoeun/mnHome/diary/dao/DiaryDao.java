package com.core.tjoeun.mnHome.diary.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DiaryDao {
	
	public int insertDiary(Map map);

	public List<HashMap> selectDiary(Map map);
	
	public int deleteDiary(ArrayList<String> list);
	
	public int modifyDiary(Map map);

}
