package com.invest.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.invest.stock.dao.StockTradeDao;
import com.invest.stock.dto.OrderStockDto;
import com.invest.stock.dto.StockQuantityDto;

@Service
public class StockTradeService {

	@Autowired
	StockTradeDao dao;
	
	public void addOrder(OrderStockDto order,String userid,String srtnCd,String itmsNm) {
		String accountid = dao.getAccountId(userid);
		
		order.setAccountid(accountid);;
		order.setUserid(userid);
		order.setItmsNm(itmsNm);
		dao.addOrder(order);
		System.out.println(accountid);
	}
	

	@Scheduled(cron = "0 0 0/1 * * * ")
	@Transactional
	public void stockBuyTrade() {
		List<OrderStockDto> order = dao.orderList(); //주문일자 check
		 
		for (OrderStockDto list : order) {

			long balance = dao.getBalance(list.getAccountid());
			System.out.println(list);
		 if(balance > list.getQuantity() * list.getOrderPrice()) {
				int price = dao.getPrice(list.getSrtnCd());
				if(list.getOrderPrice() >= price) {
					dao.updateAddOrder(list.getNo());//  체결 상태 변경
					dao.tradeResult(list); // 보유 수량 추가
					dao.buyTradeInfo(list); //개래내역 추가
					dao.stockBuyBalance(balance-(list.getQuantity() * list.getOrderPrice()), list.getAccountid()); // 잔액변경
				}
			}
		}
	}
	
	
	@Transactional
	public void stockSellTrade(String userid, StockQuantityDto stockQuantity,int tradeNo,int quantity,String srtnCd) {
		stockQuantity.setUserid(userid);
		String accountid = dao.getAccountId(userid); 
		stockQuantity.setAccountid(accountid);
		long balance = dao.getBalance(accountid);
		int sellStock = dao.getLastestPrice(srtnCd);
		System.out.println(sellStock);

				dao.stockSellUpdate(stockQuantity);
				dao.stockSellBalance(balance, accountid, sellStock);
				dao.deleteQuantity(userid);
				dao.sellTradeInfo(stockQuantity);
				System.out.println("done");
	
	}
}
