package com.invest.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;

@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/news")
    public String news(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "15") int size,
                       Model model) {
        PageInfo<News> newsPageInfo = newsService.getNews(page, size);
        newsPageInfo.setNumber(page); 
        model.addAttribute("newsPage", newsPageInfo);
        return "news/news";
    }

    
    @GetMapping("/news/{topic}")
    public String newsByTopic(@PathVariable String topic, @RequestParam(defaultValue = "0") int page,
                              @RequestParam(defaultValue = "15") int size, Model model) {
        PageInfo<News> newsPage = newsService.getNewsByTopic(topic, page, size);
        newsPage.setNumber(page); // Set the current page number
        model.addAttribute("newsPage", newsPage);
        model.addAttribute("topic", topic);
        return "news/news_topic";
    }

    

}
