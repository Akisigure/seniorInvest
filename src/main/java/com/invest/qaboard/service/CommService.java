package com.invest.qaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.qaboard.dao.CommDao;
import com.invest.qaboard.dto.CommDto;

@Service
public class CommService {
	@Autowired
	CommDao dao;
	
	public List<CommDto> selectComm(int no){
		return dao.selectComm(no);
	}
	public CommDto selectOneComm(int cno){
		return dao.selectOneComm(cno);
	}
	
	public int insertComm(CommDto dto) {
		return dao.insertComm(dto);
	}
	public int deleteComm(int cno) {
		return dao.deleteComm(cno);
	}
	public int updateComm(CommDto dto) {
		return dao.updateComm(dto);
	}
}
