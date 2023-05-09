package com.invest.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	
    @GetMapping("/")
    public String home(Model model) {
    	System.out.println("updateNews is called!");
        return "home";
    }
    
}