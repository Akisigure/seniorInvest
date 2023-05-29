package com.invest.qaboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.invest.qaboard.dto.CommDto;

@Mapper
public interface CommDao {
	 @Select("select * from comm where no = #{no} order by regdate asc") 
	List<CommDto> selectComm(int no);

	@Insert("insert into comm (id, content, no, regdate) values(#{id},  #{content}, #{no}, now())")
	int insertComm(CommDto dto);

	@Delete("delete from comm where cno = #{cno}")
	int deleteComm(int cno);
	
	@Select("select * from comm where cno = #{cno}")
	CommDto selectOneComm(int cno);
	
	@Update("update comm set content = #{content} where cno =#{cno}")
	int updateComm(CommDto dto);

}
