package com.core.tjoeun.mnHome.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardDao {
	
	public int insertBoard(Map map);
	
	public List<HashMap> selectBoardList(Map map);
	
	public Map getBoardPage(Map map);
	
	public int deleteBoard(ArrayList<String> list);
	
	public int checkFriend(Map checkMap);
}
