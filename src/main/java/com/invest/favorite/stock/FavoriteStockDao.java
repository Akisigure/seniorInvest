package com.invest.favorite.stock;

import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Optional;

@Mapper
public interface FavoriteStockDao {
	@Update("UPDATE favoriteStock SET favorited = #{favorited} WHERE userid = #{userid} AND accountId = #{accountId} AND itmsNm = #{itmsNm}")
	void updateFavoriteStock(FavoriteStockDto favoriteStockDto);


    @Insert("insert into favoriteStock (userid, accountId, itmsNm, favorited) values(#{userid}, #{accountId}, #{itmsNm}, #{favorited})")
    int addFavoriteStock(FavoriteStockDto favoriteStockDto);

    @Delete("delete from favoriteStock where no = #{no}")
    int removeFavoriteStock(int no);

    @Select("SELECT * FROM favoriteStock WHERE userid = #{userid} AND accountId = #{accountId} AND itmsNm = #{itmsNm}")
    Optional<FavoriteStockDto> findByUserIdAndAccountIdAnditmsNm(@Param("userid") String userid, @Param("accountId") String accountId, @Param("itmsNm") String itmsNm);
    
    @Select("SELECT * FROM favoriteStock WHERE userid = #{userid} AND favorited = true")
    List<FavoriteStockDto> getFavoriteStocks(@Param("userid") String userid);


}