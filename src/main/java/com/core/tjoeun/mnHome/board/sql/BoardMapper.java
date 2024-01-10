package com.core.tjoeun.mnHome.board.sql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardMapper {
	
	public int insertBoard(Map map);
	
	public List<HashMap> selectBoardList(Map map);
	
	public Map getBoardPage(Map map);
	
	public int deleteBoard(ArrayList<String> list);
}
