package cim.invest.imsi;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FavoriteStockDAOImpl implements FavoriteStockDAO {
    private final SqlSession sqlSession;

    @Autowired
    public FavoriteStockDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<FavoriteStock> getAllFavoriteStocks() {
        return sqlSession.selectList("getAllFavoriteStocks");
    }
}
