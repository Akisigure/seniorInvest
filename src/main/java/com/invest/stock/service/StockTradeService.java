package com.invest.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.invest.stock.dao.OrderStockDao;
import com.invest.stock.dto.OrderStockDto;
import com.invest.stock.dto.StockQuantityDto;

@Service
public class StockTradeService {

	@Autowired
	OrderStockDao dao;
	
	public void addOrder(OrderStockDto order,String userid) {
		order.setUserid(userid);
		
		dao.addOrder(order);
	}
	
	@Transactional
	public void stockBuyTrade(String userid, StockQuantityDto quantity) {
		String accountid = dao.getAccountId(userid); //계좌정보 가져오기
		List<OrderStockDto> order = dao.orderList(); //주문일자 check
		
		int balance = dao.getBalance(accountid);
		
		
		for (OrderStockDto list : order) {
			System.out.println(list);
		 if(balance > list.getQuantity() * list.getOrderPrice()) {
				int price = dao.getPrice(list.getSrtnCd());
				if(list.getOrderPrice() >= price) {
					dao.updateAddOrder(list.getNo());//  체결 상태 변경
					dao.tradeResult(list); // 보유 수량 추가
					dao.stockBuyBalance(balance-(list.getQuantity() * list.getOrderPrice()), accountid); // 잔액변경
				}
			}
		}
	}
	
	
	@Transactional
	public void stockSellTrade(String userid, StockQuantityDto quantity) {
		String accountid = dao.getAccountId(userid); //계좌정보 가져오기
		List<OrderStockDto> order = dao.orderList(); //주문일자 check
		
		int balance = dao.getBalance(accountid);
		
		
		for (OrderStockDto list : order) {
			System.out.println(list);
		 if(balance > list.getQuantity() * list.getOrderPrice()) {
				int price = dao.getPrice(list.getSrtnCd());
				if(list.getOrderPrice() >= price) {
					dao.updateAddOrder(list.getNo());//  체결 상태 변경
					dao.tradeResult(list); // 보유 수량 추가
					dao.stockBuyBalance(balance-(list.getQuantity() * list.getOrderPrice()), accountid); // 잔액변경
				}
			}
		}
	}
	
	
	
}
