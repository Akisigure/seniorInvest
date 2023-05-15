package com.invest.news;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NewsMapper {
	
	@Update("CREATE TABLE IF NOT EXISTS news(" +
            "id BIGINT AUTO_INCREMENT PRIMARY KEY," +
            "author VARCHAR(255)," +
            "title VARCHAR(255)," +
            "description TEXT," +
            "url VARCHAR(255)," +
            "urlToImage VARCHAR(255)," +
            "publishedAt VARCHAR(255)," +
            "content TEXT)")
    void createTable();
	
    @Delete("DELETE FROM news")
    void deleteAll();
    
    @Select("SELECT * FROM news")
    List<News> findAll();

    @Select("SELECT * FROM news ORDER BY publishedAt DESC LIMIT 1")
    News findTopByOrderBypublishedAtDesc();

    @Insert("INSERT INTO news(author, title, description, url, urlToImage, publishedAt, content) VALUES (#{author}, #{title}, #{description}, #{url}, #{urlToImage}, #{publishedAt}, #{content})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void save(News news);
    
    @Select("SELECT COUNT(*) FROM news")
    int count();

    @Select("SELECT * FROM news ORDER BY publishedAt DESC LIMIT #{size} OFFSET #{offset}")
    List<News> findWithPagination(@Param("offset") int offset, @Param("size") int size);
}
