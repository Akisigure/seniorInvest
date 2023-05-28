package com.invest.home;

import com.invest.news.News;
import com.invest.news.NewsService;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class HomeController {

	@Autowired
	private NewsService newsService;

	@ModelAttribute
	public void addAttributes(Model model, Principal principal) {
		if (principal != null) {
			String username = principal.getName();
			model.addAttribute("username", username);
		}
	}

	@GetMapping("/")
	public String home(Model model) {
		News latestNews = newsService.getLatestNews();
		model.addAttribute("latestNews", latestNews);
		return "home/home";
	}
}
