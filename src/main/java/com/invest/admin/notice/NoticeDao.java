package com.invest.admin.notice;

import java.util.List;

import org.apache.ibatis.annotations.*;

@Mapper
public interface NoticeDao {
    @Select("SELECT * FROM Notice")
    List<NoticeDto> selectAllNotices();
    
    @Select("SELECT * FROM Notice WHERE id = #{id}")
    NoticeDto selectNoticeById(int id);
    
    @Select("SELECT MAX(id) FROM Notice")
    Integer getNextId();
    
    @Insert("INSERT INTO Notice (title, content, date) VALUES (#{title}, #{content}, #{date})")
    int insertNotice(NoticeDto notice);

    @Update("UPDATE Notice SET title = #{notice.title}, content = #{notice.content}, date = #{notice.date} WHERE id = #{notice.id}")
    int updateNotice(@Param("notice") NoticeDto notice);
    
    @Delete("DELETE FROM Notice WHERE id = #{id}")
    int deleteNotice(int id);
    
    
    
}
