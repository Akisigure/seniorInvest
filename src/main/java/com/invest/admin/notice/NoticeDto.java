package com.invest.admin.notice;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeDto {
    private int id;
    private String title;
    private String content;
    private Date date;
}
