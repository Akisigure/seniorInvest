package com.invest.qaboard.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QaDto {
	private int no;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private String subject;
	private String category;
	private int readcount;
	private int ref;// 그룹 번호
	private int re_step; // 그룹 내 순서
	private int re_level;// 레벨
}