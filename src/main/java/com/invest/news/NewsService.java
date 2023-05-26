package com.invest.news;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Service
@EnableScheduling
public class NewsService {

    @Autowired
    private NewsDao newsDao;

    @Scheduled(cron = "* * * * * 1")
    public void updateNews() {
        newsDao.deleteAll();
        System.out.println("NEWS 스케줄러 작동");
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-Naver-Client-Id", "6TE7xniYwivNNfn5tygO");
        headers.set("X-Naver-Client-Secret", "uiXC3il1NB");
        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

        String[] topics = {"반도체주", "2차전지주", "전기자동차주", "고령화주", "코로나주", "임플란트주", "AI주", "우주항공주"};

        for (String topic : topics) {
            String apiUrl = "https://openapi.naver.com/v1/search/news.json?query=" + topic + "&display=50";

            ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

            try {
                ObjectMapper mapper = new ObjectMapper();
                JsonNode root = mapper.readTree(response.getBody());
                JsonNode articles = root.path("items");

                for (JsonNode article : articles) {
                    News news = new News();
                    news.setTopic(topic);
                    news.setTitle(article.get("title").asText());
                    news.setDescription(article.get("description").asText());
                    news.setUrl(article.get("link").asText());
                    news.setPublishedAt(article.get("pubDate").asText());
                    JsonNode contentNode = article.get("content");
                    if (contentNode != null) {
                        news.setContent(contentNode.asText());
                    } else {
                        news.setContent("");
                    }

                    newsDao.save(news);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public PageInfo<News> getNews(int page, int size) {
        int totalElements = newsDao.count();
        List<News> content = newsDao.findWithPagination(page * size, size);
        PageInfo<News> pageInfo = new PageInfo<>();
        pageInfo.setContent(content);
        pageInfo.setPageNumber(page);
        pageInfo.setPageSize(size);
        pageInfo.setTotalPages((int) Math.ceil((double) totalElements / size));

        return pageInfo;
    }
    
    public News getLatestNews() {
        return newsDao.getLatestNews();
    }
    
    public PageInfo<News> getNewsByTopic(String topic, int page, int size) {
        int totalElements = newsDao.countByTopic(topic);
        List<News> content = newsDao.findWithPaginationAndTopic(topic, page * size, size);
        PageInfo<News> pageInfo = new PageInfo<>();
        pageInfo.setContent(content);
        pageInfo.setPageNumber(page);
        pageInfo.setPageSize(size);
        pageInfo.setTotalPages((int) Math.ceil((double) totalElements / size));

        return pageInfo;
    }
}

