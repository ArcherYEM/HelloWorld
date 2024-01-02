package com.core.tjoeun.mnHome.profile.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface ProfileService {

	public void download(MultipartFile mFile) throws Exception;
	
	public void addProfileHistory(Map map, String userNickname, String msg, String fileStatus) throws Exception;
}
