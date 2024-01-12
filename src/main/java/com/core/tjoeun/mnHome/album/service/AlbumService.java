package com.core.tjoeun.mnHome.album.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface AlbumService {
	
	public void insertAlbum(MultipartFile[] uploadFile, Map map) throws Exception;
	
	public List<HashMap> getAlbum(Map map);
	
	public void updateAlbum(Map map) throws Exception;

}
