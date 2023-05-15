package com.invest.stock;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import jakarta.annotation.PostConstruct;

import java.util.List;

@Service
@EnableScheduling
public class StockInfoService {

    @Autowired
    private StockInfoMapper stockInfoMapper;
    
    @PostConstruct
    public void init() {
        stockInfoMapper.createTable();
    }

    @Scheduled(cron = "1 * * * * *")
    public void updateStockInfo() {
        stockInfoMapper.deleteAll();
        System.out.println("updateStockInfo is called!");
        RestTemplate restTemplate = new RestTemplate();
        String serviceKey = "9fdg2a27x2K5ivetsdp5D67JkaQngG5JsqC8eRfI9srBKCHLhbwWdYKudExyA%2FYN7jcNXWv5MiVvFYVsABt%2Fpw%3D%3D";
        String apiUrl = "https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo?serviceKey="
                + serviceKey + "&mrktCls=KOSPI&numOfRows=1000&resultType=json"; 

        HttpHeaders headers = new HttpHeaders();
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("User-Agent", "Mozilla/5.0");

        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

        System.out.println("API Response: " + response.getBody());

        try {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
            JsonNode items = root.path("items");

            for (JsonNode item : items) {
                StockInfo stockInfo = new StockInfo();
                stockInfo.setSrtnCd(item.get("srtnCd").asInt());
                stockInfo.setItmsNm(item.get("itmsNm").asText());
                stockInfo.setClpr(item.get("clpr").asInt());
                stockInfo.setVs(item.get("vs").asInt());
                stockInfo.setFltRt(item.get("fltRt").asDouble());
                stockInfo.setMkp(item.get("mkp").asInt());
                stockInfo.setHipr(item.get("hipr").asInt());
                stockInfo.setLopr(item.get("lopr").asInt());
                stockInfo.setTrqu(item.get("trqu").asInt());
                stockInfo.setTrPrc(item.get("trPrc").asInt());
                stockInfo.setLstgStCnt(item.get("lstgStCnt").asInt());
                stockInfo.setMrktTotAmt(item.get("mrktTotAmt").asInt());

                stockInfoMapper.save(stockInfo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<StockInfo> getStockInfo() {
        return stockInfoMapper.findAll();
    }
    
    public String checkService() {
        return "Stock Service is running!";
    }
}

