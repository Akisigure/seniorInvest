package com.invest.news;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface NewsDao {
    @Update("CREATE TABLE IF NOT EXISTS news(" +
            "id BIGINT AUTO_INCREMENT PRIMARY KEY," +
            "topic VARCHAR(255)," +
            "title VARCHAR(255)," +
            "description TEXT," +
            "url VARCHAR(255)," +
            "publishedAt VARCHAR(255)," +
            "content TEXT)")
    void createTable();
	
    @Delete("DELETE FROM news")
    void deleteAll();
    
    @Select("SELECT * FROM news")
    List<News> findAll();

    @Select("SELECT COUNT(*) FROM news")
    int count();

    @Select("SELECT * FROM news ORDER BY publishedAt DESC LIMIT #{size} OFFSET #{offset}")
    List<News> findWithPagination(@Param("offset") int offset, @Param("size") int size);

    @Insert("INSERT INTO news(topic, title, description, url, publishedAt, content) VALUES (#{topic}, #{title}, #{description}, #{url}, #{publishedAt}, #{content})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void save(News news);
    
    @Select("SELECT * FROM news ORDER BY id DESC LIMIT 1")
    News getLatestNews();
    
    @Select("SELECT COUNT(*) FROM news WHERE topic = #{topic}")
    int countByTopic(@Param("topic") String topic);

    @Select("SELECT * FROM news WHERE topic = #{topic} ORDER BY publishedAt DESC LIMIT #{size} OFFSET #{offset}")
    List<News> findWithPaginationAndTopic(@Param("topic") String topic, @Param("offset") int offset, @Param("size") int size);
}
