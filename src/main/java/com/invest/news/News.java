package com.invest.news;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class News {
    private Long id;
    private String author;
    private String title;
    private String description;
    private String url;
    private String urlToImage;
    private String publishedAt;
    private String content;
}