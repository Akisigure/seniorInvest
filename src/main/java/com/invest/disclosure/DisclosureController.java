package com.invest.disclosure;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.mail.Service;

@Controller
public class DisclosureController {

	@Autowired
	DisclosureService service;
	
	
	
	@PostMapping("ajax/disclosure") //API AJAX호출
	@ResponseBody
	public DisclosureCommand ajaxDisclosure(Model m) {
		
		

		DisclosureCommand list = service.disclosureAjax();
		System.out.println(list);
		m.addAttribute("list",list);
	
		
		return list;
	}
	
	@GetMapping("/disclosure")
	public String disclosurePage(Model m) {
		
		int hol = service.holiday;
		m.addAttribute("holiday",hol);
		return "disclosure/disclosure";
	}

}
