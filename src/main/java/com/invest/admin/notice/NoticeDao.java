package com.invest.admin.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDao {
	
	int insert(NoticeDto dto);
	List<NoticeDto> noticeList(Map<String,Object> m);
	int count();
	NoticeDto noticeOne(int noticeNo);
	int updateNotice(NoticeDto dto);
	int deleteNotice(int noticeNo);
	int addReadcount(int noticeNo);
	List<NoticeDto> noticeListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);
	
	
}