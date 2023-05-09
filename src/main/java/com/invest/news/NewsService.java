package com.invest.news;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class NewsService {
    @Autowired
    private NewsRepository newsRepository;

    @Scheduled(cron = "0 0 3 * * *")
    public void updateNews() {
        RestTemplate restTemplate = new RestTemplate();
        String apiUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=4169a009e56148aea0c63c4b201330a1";
        String response = restTemplate.getForObject(apiUrl, String.class);
        System.out.println("API Response: " + response);

        try {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response);
            JsonNode articles = root.path("articles");

            for (JsonNode article : articles) {
                News news = new News();
                news.setAuthor(article.get("author").asText());
                news.setTitle(article.get("title").asText());
                news.setDescription(article.get("description").asText());
                news.setUrl(article.get("url").asText());
                news.setUrlToImage(article.get("urlToImage").asText());
                news.setPublishedAt(article.get("publishedAt").asText());
                news.setContent(article.get("content").asText());
                
                newsRepository.save(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String checkService() {
        return "Service is running!";
    }
}
