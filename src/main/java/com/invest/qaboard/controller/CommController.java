package com.invest.qaboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.invest.qaboard.dto.CommDto;
import com.invest.qaboard.dto.QaDto;
import com.invest.qaboard.service.CommService;

@RestController
public class CommController {
	@Autowired
	CommService service;
	
	@GetMapping("/qa/commentRegister")
	@ResponseBody
	public String insertComm(int no, CommDto dto) {
		service.insertComm(dto);
		List<CommDto> cList = service.selectComm(dto.getNo());
		Gson gson = new Gson();

		return gson.toJson(cList); // List -> js.array
	}
	
	
	@GetMapping("/qa/commentDelete/{cno}")
	public String deleteComm(@PathVariable int cno) {
		service.deleteComm(cno);
		return cno+"";
	}
	
	
	//updateForm
	@GetMapping("/qa/commentUpdate/{cno}")
	public String updateCommForm(@PathVariable int cno, Model m) {
		CommDto dto = service.selectOneComm(cno);
		Gson gson = new Gson();
		return gson.toJson(dto);
	}


}
