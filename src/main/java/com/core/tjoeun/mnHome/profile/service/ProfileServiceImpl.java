package com.core.tjoeun.mnHome.profile.service;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.core.tjoeun.index.member.dao.MemberDao;
import com.core.tjoeun.mnHome.profile.dao.ProfileDao;

@Service
@EnableTransactionManagement
public class ProfileServiceImpl implements ProfileService {
  
    @Value("${file.upload.path}")
    private String fileUploadPath;

    @Autowired
    ProfileDao profileDao;
    
    String filename;
    
    @Override
    public void download(MultipartFile mFile) throws Exception {
    	
        String o_filename = mFile.getOriginalFilename();
        String n_filename = UUID.randomUUID().toString() + "-" + o_filename;
        filename=n_filename;
        
        File newFile = new File(fileUploadPath + File.separator + n_filename);
        try {

            mFile.transferTo(newFile);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
    @CacheEvict(key="#userNickname", value="profile")
    public void addProfileHistory(Map map, String userNickname, String msg, String fileStatus) throws Exception {
        map.put("userNickname", userNickname);
        map.put("msg", msg);

        if ("noFile".equals(fileStatus)) {
        	map.put("userNickname", userNickname);
            map.put("image", "noneFile");
            map.put("msg",msg);
        } else {
        	map.put("userNickname", userNickname);
    		map.put("image",filename);
    		map.put("msg",msg);
        }

        int result = profileDao.addProfileHistory(map);
        if (result != 1) {
            throw new Exception();
        }
    }

}
