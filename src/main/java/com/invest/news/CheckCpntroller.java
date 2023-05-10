package com.invest.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CheckCpntroller {

    private final NewsService NewsService;

    @Autowired
    public CheckCpntroller(NewsService newsService) {
        this.NewsService = newsService;
    }

    @GetMapping("/check")
    public String checkService() {
        return NewsService.checkService();
    }
    
}
