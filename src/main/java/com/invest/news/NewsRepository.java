package com.invest.news;

import org.springframework.data.jpa.repository.JpaRepository;

// JpaRepository 인터페이스를 확장하는 뉴스 리포지토리
public interface NewsRepository extends JpaRepository<News, Long> {
}