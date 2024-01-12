package com.core.tjoeun.mnHome.album.sql;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AlbumMapper {
	
	public int insertAlbum(Map map);
	
	public List<HashMap> selectAlbum(Map map);
	
	public int updateAlbum(Map map);

}
