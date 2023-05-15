package com.invest.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;

@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;

	@GetMapping("/news")
	public String news(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "15") int size,
			Model model) {
		PageInfo<News> newsPage = newsService.getNews(page, size);

		model.addAttribute("newsList", newsPage.getContent());
		model.addAttribute("totalPages", (newsPage.getTotalElements() + size - 1) / size);
		model.addAttribute("currentPage", page);
		return "news";
	}

}
