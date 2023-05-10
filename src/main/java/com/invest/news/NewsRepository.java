package com.invest.news;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.invest.news.News;

public interface NewsRepository extends JpaRepository<News, Long> {
    Page<News> findAll(Pageable pageable);
    News findTopByOrderByPublishedAtDesc();

}
