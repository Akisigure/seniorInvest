package com.invest.favorite.stock;

import org.apache.ibatis.annotations.*;
import java.util.List;
import java.util.Optional;

@Mapper
public interface FavoriteStockDao {

    @Insert("insert into favoriteStock (no, userid, accountId, itmsNm) values(#{no}, #{userid}, #{accountId}, #{itmsNm})")
    int addFavoriteStock(FavoriteStockDto favoriteStockDto);

    @Select("select * from favoriteStock where userid = #{userid} and accountId = #{accountId}")
    List<FavoriteStockDto> getFavoriteStocks(@Param("userid") String userid, @Param("accountId") String accountId);

    @Delete("delete from favoriteStock where no = #{no}")
    int removeFavoriteStock(int no);

    @Select("SELECT * FROM favoriteStock WHERE userid = #{userid} AND accountId = #{accountId} AND itmsNm = #{itmsNm}")
    Optional<FavoriteStockDto> findByUserIdAndAccountIdAnditmsNm(@Param("userid") String userid, @Param("accountId") String accountId, @Param("itmsNm") String itmsNm);

    // Commented out until the database column 'favorited' is confirmed
    // @Update("update favoriteStock set favorited = #{favorited} where no = #{no}")
    // int updateFavoriteStatus(@Param("no") int no, @Param("favorited") boolean favorited);
}