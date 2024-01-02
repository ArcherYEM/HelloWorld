package com.core.tjoeun.index.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.core.tjoeun.index.notice.dao.NoticeDao;

@Service
@EnableTransactionManagement
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDao noticeDao;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void writeNotice(Map map) throws Exception {
		
		int result = noticeDao.insertNotice(map);
		
		if( 1 != result) {
			throw new Exception();
		}
		
	}

	@Override
	@Transactional(readOnly = true, propagation = Propagation.REQUIRES_NEW)
	public List<HashMap> getNoticeList(Map map) {
		
		
		Object page = map.get("page");
		
		
		if(null == page || "".equals(page)) {
			map.put("limit", 10);
			map.put("offset",0);
			map.put("page",1);
		}else {
			
			int ipage = Integer.parseInt((String)page);
			map.put("limit", 10);
			map.put("offset", 10 * (ipage-1));
		}
		
		return noticeDao.selectNotice(map);

	
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
	public void deleteNotice(ArrayList<String> list) throws Exception {
		int result = noticeDao.deleteNotice(list);
		
		if(result != list.size()) {
			throw new Exception();
		}
		
	}

	@Override
	public long getPage() {
		
		long total = (Long)noticeDao.getTotalPage().get("noticeTotal");
		long page =  (total/10);
		
		if(0 < total % 10) {
			page++;
		}
		return page;
	}
	
	

}
