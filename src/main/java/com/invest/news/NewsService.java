package com.invest.news;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

// @Service 어노테이션을 통해 스프링 컴포넌트로 등록
// @EnableScheduling 어노테이션을 통해 스프링의 스케줄링 기능 활성화
@Service
@EnableScheduling
public class NewsService {

    // NewsRepository를 자동으로 주입
    @Autowired
    private NewsRepository newsRepository;

    // 매 분마다 뉴스를 업데이트하는 스케줄러
    // @Scheduled 어노테이션을 통해 스케줄러 설정
    // @Transactional 어노테이션을 통해 메소드 실행 도중 예외 발생 시 롤백 수행
    @Scheduled(cron = "10 * * * * *")
    @Transactional
    public void updateNews() {
    	System.out.println("updateNews is called!");
        RestTemplate restTemplate = new RestTemplate();
        String apiUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=4169a009e56148aea0c63c4b201330a1";
        String response = restTemplate.getForObject(apiUrl, String.class);
        System.out.println("API Response: " + response);

        try {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response);
            JsonNode articles = root.path("articles");

            // 각 기사에 대해 News 객체를 생성하고 저장
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
    
    // 서비스가 정상적으로 동작하는지 확인하는 메소드
    public String checkService() {
        return "Service is running!";
    }
}
