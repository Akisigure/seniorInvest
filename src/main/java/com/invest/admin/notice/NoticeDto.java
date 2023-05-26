package com.invest.admin.notice;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {
    private int noticeNo;
    private String username;
    private String userid;
    private int readcount;
    private String title;
    private String content;
    private Date regdate;
}
