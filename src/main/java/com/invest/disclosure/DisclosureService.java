package com.invest.disclosure;

import java.net.URI;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;


@Service
public class DisclosureService {
	
	@Autowired
	RestTemplate restTemplate;

	@Value("${DIS-API-KEY}")
	private String crtfc_key;

	LocalDate now = LocalDate.now();
	DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
	String formatedNow = now.format(format);
	
	DayOfWeek getHoliday = now.getDayOfWeek();
	int holiday = getHoliday.getValue();
	
	public DisclosureCommand disclosureAjax() {
	
	URI uri = UriComponentsBuilder //최근 공시 30개씩 받아옴
            .fromUriString("https://opendart.fss.or.kr/api/list.json")
            .queryParam("crtfc_key",crtfc_key)
            .queryParam("end_de", formatedNow)
            .queryParam("sort", "date")
            .queryParam("sort_mth", "desc")
            .queryParam("page_no", "1")
            .queryParam("page_count", 30)
            .queryParam("rcept_dt", "rcept_dt")
            .encode()
            .build()
            .toUri();
	
	DisclosureCommand list =restTemplate.getForObject(uri, DisclosureCommand.class);
	
		return list;

	}
	

}
