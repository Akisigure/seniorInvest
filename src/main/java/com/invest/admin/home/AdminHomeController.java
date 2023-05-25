package com.invest.admin.home;

import com.invest.news.News;
import com.invest.news.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHomeController {

    @GetMapping("/adminhome")
    public String adminhome(Model model) {
    	
        return "admin/adminhome";
    }
}