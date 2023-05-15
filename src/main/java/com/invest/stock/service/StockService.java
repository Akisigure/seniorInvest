package com.invest.stock.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.invest.stock.dao.StockDao;
import com.invest.stock.dto.StockDto;
import com.invest.stock.dto.StockList;
import com.invest.stock.dto.StockResponse;

import jakarta.annotation.PostConstruct;

@Service
public class StockService {

	@Autowired
	StockDao dao;

	@Autowired
	SqlSession sqlsession;


	   public void createTable() {
	        dao.createTable();
	    }
	   
	   @Scheduled(cron = "1 * * * * *")
	public void stockInsert() throws Exception {
		String serviceKey = "jjA%2Bdd%2Fz80CgwZaLgOKvgscjB7ZEfgPSgh7fl%2FRdFCNNRR%2BBAMcG9%2FCXuECTRX7iBsIIGy1W%2BFCvEclcYI9iRw%3D%3D";
		String requestUrl = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey="
				+ serviceKey + "&numOfRows=948&resultType=json&mrktCls=KOSPI&basDt=20230512"; // 결과 형식을 JSON으로 설정하였습니다.

		URL url = new URL(requestUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET"); // GET 방식으로 요청합니다.
		conn.setRequestProperty("Content-type", "application/json"); // 응답 데이터 형식을 JSON으로 설정합니다.;
		conn.setRequestProperty("mrktCls", "KOSPI");
		conn.setRequestProperty("basDt", "20230512");
		System.out.println("Response code: " + conn.getResponseCode());

		BufferedReader br;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else { // 에러 발생 시
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;

		while ((line = br.readLine()) != null) {
			sb.append(line);
		}

		br.close();
		conn.disconnect();

		System.out.println("response: " + sb.toString()); // 응답 결과 출력
		String jsonStr = sb.toString();
		Gson gson = new Gson();
		StockList stock = gson.fromJson(jsonStr, StockList.class);

		for (int i = 0; i < stock.getResponse().getBody().getPageNo(); i++) {
			for (int j = 0; j < stock.getResponse().getBody().getNumOfRows(); j++) {
				StockDto st = stock.getResponse().getBody().getItems().getItem().get(j);

				dao.insertStock(st);

			}
		} 
	}
	
    @PostConstruct
    public void init() {
        createTable();
    }

}
