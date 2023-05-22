package com.invest.admin.notice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface NoticeDao {
    @Select("SELECT * FROM Notice")
    List<NoticeDto> selectAllNotices();
    
    @Select("SELECT * FROM Notice WHERE id = #{id}")
    NoticeDto selectNoticeById(int id);
    
    @Insert("INSERT INTO Notice (title, content, date) VALUES (#{title}, #{content}, #{date})")
    int insertNotice(NoticeDto notice);
    
    @Update("UPDATE Notice SET title = #{title}, content = #{content}, date = #{date} WHERE id = #{id}")
    int updateNotice(NoticeDto notice);
    
    @Delete("DELETE FROM Notice WHERE id = #{id}")
    int deleteNotice(int id);

}
