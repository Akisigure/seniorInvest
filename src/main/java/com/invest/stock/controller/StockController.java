package com.invest.stock.controller;

import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.invest.stock.command.Stock;
import com.invest.stock.command.StockInfo;
import com.invest.stock.dto.StockDto;
import com.invest.stock.service.StockService;

@Controller
public class StockController {

	@Autowired
	StockService service;

	@Autowired
	RestTemplate restTemplate;

	@GetMapping("/getStockPriceInfo")
	@ResponseBody
	public String stockDetailPage(Model m) {

		  URI uri = UriComponentsBuilder.fromUriString("https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService")
		            .path("/getStockPriceInfo")
		            .queryParam("serviceKey",service.getAPI())
		            .queryParam("resultType", "xml")
		            .encode()
		            .build()
		            .toUri();

			/*
			 * RequestEntity<Void> req = RequestEntity .get(uri) .header("Accept",
			 * "application/xml") // 변경된 부분 .build();
			 */

		    //ResponseEntity<String> response = restTemplate.exchange(req, String.class);

			/*
			 * System.out.println(response.getHeaders());
			 * System.out.println(response.getBody());
			 */
		  Stock list =restTemplate.getForObject(uri, Stock.class);
			m.addAttribute("stockList", list);
		  
		    return "stock/stockDetail";
	}

	@GetMapping("/stockSearch")
	public String stockSearch() {

		return "stock/stockSearch";
	}

}
