package com.invest.qaboard.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.invest.qaboard.dao.QaDao;
import com.invest.qaboard.dto.QaDto;
import com.invest.user.dto.Users;



@Service
public class QaService {

	@Autowired
	QaDao dao;

	public int count() {
		return dao.count();
	}

	public List<QaDto> selectList(int start){
		Map<String, Object> m = new HashMap<>();
		m.put("start", start);
		m.put("count", 10);
		return dao.selectList(m);
	}


	public void insert(QaDto dto) {
			
			if(dto.getRef() == 0 ) { // 제목글
				dao.insert(dto);
				//System.out.println("no :: "+dto.getNo());
				dao.updateRef(dto.getNo());
			}else { //답글
				dao.updateStep(dto);
				dto.setRe_step(dto.getRe_step()+1);
				dto.setRe_level(dto.getRe_level()+1);
				dao.insert(dto);
			}	
	}

	public QaDto selectOne(int no) {
		dao.updateReadcount(no); 
		return dao.selectOne(no);
	}
	public int updateBoard(QaDto dto) {
		return dao.updateBoard(dto);
	}

	public int deleteBoard(int no) {
		return dao.deleteBoard(no);
	}

	



}
