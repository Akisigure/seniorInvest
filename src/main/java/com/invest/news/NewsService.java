package com.invest.news;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

@Service
@EnableScheduling
public class NewsService {

    @Autowired
    private NewsRepository newsRepository;

    @Scheduled(cron = "1 * * * * *")
    @Transactional
    public void updateNews() {
    	newsRepository.deleteAll();
        System.out.println("updateNews is called!");
        RestTemplate restTemplate = new RestTemplate();
        String apiUrl = "https://newsapi.org/v2/everything?q=경제&sortBy=publishedAt&language=ko&apiKey=4169a009e56148aea0c63c4b201330a1";
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("User-Agent", "Mozilla/5.0");

        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);
        try {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
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
    
    public Page<News> getNews(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        return newsRepository.findAll(pageRequest);
    }
    
    public News getLatestNews() {
        return newsRepository.findTopByOrderByPublishedAtDesc();
    }
    
    public String checkService() {
        return "Service is running!";
    }
}
