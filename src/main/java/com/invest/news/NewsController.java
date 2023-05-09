package com.invest.news;

import com.kwabenaberko.newsapilib.NewsApiClient;
import com.kwabenaberko.newsapilib.models.Article;
import com.kwabenaberko.newsapilib.models.request.EverythingRequest;
import com.kwabenaberko.newsapilib.models.response.ArticleResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

@RestController
public class NewsController {

    private final NewsApiClient newsApiClient;

    public NewsController() {
        newsApiClient = new NewsApiClient("4169a009e56148aea0c63c4b201330a1");
    }

    @GetMapping("/news")
    public List<Article> getNews() throws ExecutionException, InterruptedException {
        CompletableFuture<List<Article>> futureArticles = new CompletableFuture<>();

        newsApiClient.getEverything(
                new EverythingRequest.Builder()
                		.language("ko")
                        .q("경제")
                        .build(),
                new NewsApiClient.ArticlesResponseCallback() {
                    @Override
                    public void onSuccess(ArticleResponse response) {
                        futureArticles.complete(response.getArticles());
                    }

                    @Override
                    public void onFailure(Throwable throwable) {
                        System.out.println(throwable.getMessage());
                        futureArticles.completeExceptionally(throwable);
                    }
                }
        );

        return futureArticles.get(); // 기사 목록을 반환합니다.
    }
    
}