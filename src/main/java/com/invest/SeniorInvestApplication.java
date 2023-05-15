package com.invest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
@MapperScan(basePackages = {"com.invest.stock.dao", "com.invest.user.dao","com.invest.news"})
public class SeniorInvestApplication {

	public static void main(String[] args) {
		SpringApplication.run(SeniorInvestApplication.class, args); 
	}
	
	@Bean
	public HiddenHttpMethodFilter hiddenHttpMethodFilter() {
		return new HiddenHttpMethodFilter();
	}
	
	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
		//HTTP 요청 후 JSON, XML, String과 같은 응답 (Java Object)을 받음
	}
	
}
