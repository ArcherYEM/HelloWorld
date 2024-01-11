package com.core.tjoeun.mnHome.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardService {
	
	public void writeBoard(Map map) throws Exception;
	
	public List<HashMap> getBoardList(Map map);
	
	public Long getBoardPage(Map map);
	
	public void deleteBoard(ArrayList<String> list);
	
	public int checkFriend(Map checkMap);
}
