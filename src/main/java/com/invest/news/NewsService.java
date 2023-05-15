package com.invest.news;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import java.util.List;

@Service
@EnableScheduling
public class NewsService {

    @Autowired
    private NewsMapper newsMapper;
    
    @PostConstruct
    public void init() {
        newsMapper.createTable();
    }

    @Scheduled(cron = "1 * * * * *")
    public void updateNews() {
        newsMapper.deleteAll();
        System.out.println("updateNews is called!");
        RestTemplate restTemplate = new RestTemplate();
        String apiUrl = "https://newsapi.org/v2/everything?q=경제&sortBy=published_at&language=ko&apiKey=4169a009e56148aea0c63c4b201330a1";
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("User-Agent", "Mozilla/5.0");

        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

        System.out.println("API Response: " + response.getBody());

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
                
                newsMapper.save(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public PageInfo<News> getNews(int page, int size) {
        int totalElements = newsMapper.count();
        List<News> content = newsMapper.findWithPagination(page * size, size);
        PageInfo<News> pageInfo = new PageInfo<>();
        pageInfo.setContent(content);
        pageInfo.setPageNumber(page);
        pageInfo.setPageNumber(size);
        pageInfo.setTotalElements(totalElements);
        return pageInfo;
    }
    
    public List<News> getNews() {
        return newsMapper.findAll();
    }
    
    public News getLatestNews() {
        return newsMapper.findTopByOrderBypublishedAtDesc();
    }
    
    public String checkService() {
        return "news Service is running!";
    }
}
