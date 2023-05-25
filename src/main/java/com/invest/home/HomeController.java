package com.invest.home;

import com.invest.news.News;
import com.invest.news.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/")
    public String home(Model model) {
        News latestNews = newsService.getLatestNews();
        model.addAttribute("latestNews", latestNews);
        return "home/home";
    }
}
