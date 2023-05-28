package com.invest.favorite.stock;

import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Optional;

@Mapper
public interface FavoriteStockDao {
    @Update("UPDATE favoriteStock SET vs = #{vs}, fltRt = #{fltRt}, mkp = #{mkp}, favorited = #{favorited} WHERE userid = #{userid} AND accountId = #{accountId} AND itmsNm = #{itmsNm}")
    void updateFavoriteStock(FavoriteStockDto favoriteStockDto);

    @Insert("INSERT INTO favoriteStock (userid, accountId, itmsNm, favorited, vs, fltRt, mkp) VALUES (#{userid}, #{accountId}, #{itmsNm}, #{favorited}, #{vs}, #{fltRt}, #{mkp})")
    int addFavoriteStock(FavoriteStockDto favoriteStockDto);

    @Delete("DELETE FROM favoriteStock WHERE no = #{no}")
    int removeFavoriteStock(int no);

    @Select("SELECT * FROM favoriteStock WHERE userid = #{userid} AND accountId = #{accountId} AND itmsNm = #{itmsNm} AND vs = #{vs} AND fltRt = #{fltRt} AND mkp = #{mkp}")
    Optional<FavoriteStockDto> findByUserIdAndAccountIdAndItmsNm(
            @Param("userid") String userid,
            @Param("accountId") String accountId,
            @Param("itmsNm") String itmsNm,
            @Param("vs") int vs,
            @Param("fltRt") double fltRt,
            @Param("mkp") int mkp
    );

    @Select("SELECT * FROM favoriteStock WHERE userid = #{userid} AND favorited = true")
    List<FavoriteStockDto> getFavoriteStocks(@Param("userid") String userid);
}
