package com.invest.stock.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import com.google.gson.Gson;
import com.invest.stock.dao.StockDao;
import com.invest.stock.dto.StockDto;
import com.invest.stock.dto.StockList;


@Service
public class StockService {

	@Autowired
	StockDao dao;
	
	@Value("${API-KEY}")
	private String APIKEY;
	
	public String getAPIKEY() {
		return APIKEY;
	}
	
	//최초 1회만 실행할 것
	public void stockInsert() throws Exception {
	    String serviceKey = APIKEY;
	    String requestUrl = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey="
	           + serviceKey + "&numOfRows=948&resultType=json&mrktCls=KOSPI&basDt=20230512"; 
	 
	    URL url = new URL(requestUrl);
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json"); 
	    conn.setRequestProperty("mrktCls", "KOSPI");
	    conn.setRequestProperty("basDt", "20230512");
	    System.out.println("Response code: " + conn.getResponseCode());
	 
	    BufferedReader br;
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    } else {
	        br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    
	    StringBuilder sb = new StringBuilder();
	    String line;

	    while ((line = br.readLine()) != null) {
	        sb.append(line);
	    }

	    br.close();
	    conn.disconnect();

	    String jsonStr = sb.toString();
	    Gson gson = new Gson();
	    StockList stock = gson.fromJson(jsonStr, StockList.class);
	   
	   for(int i = 0; i < stock.getResponse().getBody().getPageNo();i++) {
		   for(int j = 0; j < stock.getResponse().getBody().getNumOfRows() ;j++) {
		    	 StockDto st = stock.getResponse().getBody().getItems().getItem().get(j);
		    	 
		    	 dao.insertStock(st);
		    	 dao.insertLastestStock(st);
		    }
	   }//for
	    
	}//method
	
	//API 갱신시간에 갱신
	@Scheduled(cron = "0 30 11 * * *")
	public void updateLastestStock() throws Exception {
		
		String serviceKey = APIKEY;
		LocalDate now = LocalDate.now().minusDays(1);
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(format);
	    String requestUrl = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey="
	           + serviceKey + "&numOfRows=948&resultType=json&mrktCls=KOSPI&basDt="+formatedNow;
	 
	    URL url = new URL(requestUrl);
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET"); 
	    conn.setRequestProperty("Content-type", "application/json");
	    conn.setRequestProperty("mrktCls", "KOSPI");
	    conn.setRequestProperty("basDt", formatedNow);
	    System.out.println("Response code: " + conn.getResponseCode());
	 
	    BufferedReader br;
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    } else { 
	        br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    
	    StringBuilder sb = new StringBuilder();
	    String line;

	    while ((line = br.readLine()) != null) {
	        sb.append(line);
	    }

	    br.close();
	    conn.disconnect();

	    String jsonStr = sb.toString();
	    Gson gson = new Gson();
	    StockList stock = gson.fromJson(jsonStr, StockList.class);
	   
	   for(int i = 0; i < stock.getResponse().getBody().getPageNo();i++) {
		   for(int j = 0; j < stock.getResponse().getBody().getNumOfRows() ;j++) {
			   
		    	 StockDto st = stock.getResponse().getBody().getItems().getItem().get(j);
		    	 
		    	 dao.updateLastestStock(st);
		    	 
		    }
	   }//for
	}

	
	@Scheduled(cron = "0 59 23 * * *")
	public void updateStock() throws Exception {
		
		String serviceKey = APIKEY;
		LocalDate now = LocalDate.now().minusDays(1);
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(format);
	    String requestUrl = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey="
	           + serviceKey + "&numOfRows=948&resultType=json&mrktCls=KOSPI&basDt="+formatedNow; 
	 
	    URL url = new URL(requestUrl);
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET"); 
	    conn.setRequestProperty("Content-type", "application/json"); 
	    conn.setRequestProperty("mrktCls", "KOSPI");
	    conn.setRequestProperty("basDt", formatedNow);
	    System.out.println("Response code: " + conn.getResponseCode());
	 
	    BufferedReader br;
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    } else { 
	        br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    
	    StringBuilder sb = new StringBuilder();
	    String line;

	    while ((line = br.readLine()) != null) {
	        sb.append(line);
	    }

	    br.close();
	    conn.disconnect();

	
	    String jsonStr = sb.toString();
	    Gson gson = new Gson();
	    StockList stock = gson.fromJson(jsonStr, StockList.class);
	   
	   for(int i = 0; i < stock.getResponse().getBody().getPageNo();i++) {
		   for(int j = 0; j < stock.getResponse().getBody().getNumOfRows() ;j++) {
			   
		    	 StockDto st = stock.getResponse().getBody().getItems().getItem().get(j);
		    	 
		    	 dao.updateStock(st);
		    	 
		    }
	  }//for
	   
	}
	
	public List<Map<String, Object>>stockSearchResult(Map<String, Object> paramMap) {
		//String srtnCd, String itmsNm
		return dao.stockSearchResult(paramMap);
		
	}
	
	public StockDto stockDetailInfo(StockDto stock) {
		return dao.stockDetailInfo(stock);
	}
	
	
	
	

	}    



