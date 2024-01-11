package com.core.tjoeun.mnHome.album.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.core.tjoeun.mnHome.album.dao.AlbumDao;

@Service
@EnableTransactionManagement
public class AlbumServiceImpl implements AlbumService{
	
	@Value("${file.upload.path}")
    private String fileUploadPath;

	@Autowired
	AlbumDao albumDao;
	
	@Override
	@Transactional(readOnly = false, rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
	public void insertAlbum(MultipartFile[] uploadFile, Map map) throws Exception {
		
		//사진  업로드
		String o_filename;
        String n_filename;
        String filename;
        List<String> filenames = new ArrayList<>();
		
		for(MultipartFile multipartFile : uploadFile) {
//			Log.info("--------------------------------");
//			Log.info("Upload File Name : " + multipartFile.getOriginalFilename());
//			Log.info("Upload File Size : " + multipartFile.getSize());
			
			o_filename = multipartFile.getOriginalFilename();
			n_filename = UUID.randomUUID().toString() + "-" + o_filename;
			filename = n_filename;
			
			File savefile = new File(fileUploadPath + File.separator + n_filename);
			try {
				multipartFile.transferTo(savefile);
				filenames.add(filename);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		for (String str : filenames) {
            if (stringBuilder.length() > 0) {
            	stringBuilder.append(","); // 쉼표 추가
            }
            stringBuilder.append(str);
        }
		
		//업로드된 파일 이름을 쉼표로 구분하여 넣음 
		map.put("imagePath", stringBuilder.toString());
		
		int result = albumDao.insertAlbum(map);
		
		if(result != 1) {
			throw new Exception();
		}
		
	}
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.REQUIRES_NEW)
	public List<HashMap> getAlbum(Map map) {
		
		return albumDao.selectAlbum(map);
	}
	
}
