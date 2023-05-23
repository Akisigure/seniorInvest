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
		long balance = dao.getBalance(accountid);
		
		order.setAccountid(accountid);;
		order.setUserid(userid);
		order.setItmsNm(itmsNm);
		dao.addOrder(order);
		
		//거래 주문 시 미리 금액 차감
		int a = dao.stockBuyBalance(balance-(order.getQuantity() * order.getOrderPrice()), accountid);
		
	}
	
	@Scheduled(cron = "0 0 0/1 * * * ")
	@Transactional
	public void stockBuyTrade() {
		List<OrderStockDto> order = dao.orderList(); //주문일자 check
		
		System.out.println("지정가 거래 스케줄러 작동.");
		for (OrderStockDto list : order) {
			
			
			long balance = dao.getBalance(list.getAccountid());
		
			if(balance > list.getQuantity() * list.getOrderPrice()) {
				
			 int price = dao.getPrice(list.getSrtnCd());
				//거래 채결 시
				if(list.getOrderPrice() >= price) {
					dao.updateAddOrder(list.getNo());//  체결 상태 변경
					dao.tradeResult(list); // 보유 수량 추가
					dao.buyTradeInfo(list); //개래내역 추가
				} 
				//미채결 시 
				else {  
					dao.deleteTradeOrder(); 
					dao.stockBuyBalance(balance+(list.getQuantity() * list.getOrderPrice()), list.getAccountid()); //미채결 시 환금
					
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
		int sellStock = dao.getLastestPrice(srtnCd) * quantity;
		System.out.println(sellStock);

				dao.stockSellUpdate(stockQuantity);
				dao.stockSellBalance(balance, accountid, sellStock);
				dao.deleteQuantity(userid);
				dao.sellTradeInfo(stockQuantity);
				System.out.println("done");
	
	}
}
