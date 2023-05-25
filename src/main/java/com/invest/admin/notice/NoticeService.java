package com.invest.admin.notice;

import com.invest.admin.notice.NoticeDao;
import com.invest.admin.notice.NoticeDto;
import com.mysql.cj.protocol.x.Notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeService {

	@Autowired
	NoticeDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<NoticeDto> NoticeList(int start) {
		
		Map<String, Object> m = new HashMap<String,Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.noticeList(m);
	}
	
	public int insert(NoticeDto dto) {
		return dao.insert(dto);
	}
	
	public NoticeDto noticeOne(int noticeNo) {
		dao.addReadcount(noticeNo);
		return dao.noticeOne(noticeNo);
	}
	
	public int updateNotice(NoticeDto dto) {
		return dao.updateNotice(dto);
	}
	
	public int deleteNotice(int no) {
		return dao.deleteNotice(no);
	}
	
	public List<NoticeDto> NoticeListSearch(int searchn, String search,int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.noticeListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		//System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	
}
