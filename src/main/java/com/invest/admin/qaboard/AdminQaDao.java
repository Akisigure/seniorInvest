package com.invest.admin.qaboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.qaboard.dto.QaDto;
@Mapper
public interface AdminQaDao {
	
	

	@Insert("insert into qaboard (id, content, subject,  ref, re_step, re_level, category) values(#{id},  #{content}, #{subject},  #{ref}, #{re_step}, #{re_level}, #{category})")
	@Options(useGeneratedKeys = true, keyProperty = "no")
	int insert(QaDto dto);
	

	@Select("select * from qaboard where no = #{no}")
	QaDto selectOne(int no);

	@Update("update qaboard set subject=#{subject}, content=#{content}, category=#{category}, re_step=#{re_step} where no=#{no}")
	int updateBoard(QaDto dto);

	@Update("update qaboard set ref = #{no} where no =#{no}") // 제목글일때만
	int updateRef(int no);

	@Update("update qaboard set re_step = re_step+1 where ref =#{ref} and re_step > #{re_step}")
	int updateStep(QaDto dto);
	
	@Select("select * from qaboard where re_step = 0 order by regdate limit #{start}, #{count}")
	List<QaDto> AllqaListSearch(Map<String, Object> m);
	
	@Select("select count(*) from qaboard")
	int count();
	
	@Update("update qaboard set readcount = readcount + 1 where no = #{no}")
	int updateReadcount(int no);

	
	List<QaDto> qaListSearch(Map<String, Object> m);

	int countCategorySearch(Map<String, Object> m);

}
