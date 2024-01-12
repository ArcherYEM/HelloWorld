package com.core.tjoeun.mnHome.album.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AlbumDao {

	public int insertAlbum(Map map);
	
	public List<HashMap> selectAlbum(Map map);
}
