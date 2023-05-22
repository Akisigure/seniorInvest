package com.invest.disclosure;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DisclosureController {

	@Autowired
	DisclosureService service;
	
	@PostMapping("ajax/disclosure")
	@ResponseBody
	public DisclosureCommand ajaxDisclosure(Model m) {

		DisclosureCommand list = service.APItest();
		
		m.addAttribute("list",list);
	
		System.out.println(list);
		return list;
	}
	
	@GetMapping("/test")
	public String test() {
		
		return "test";
	}

}
