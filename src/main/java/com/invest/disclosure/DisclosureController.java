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

		DisclosureCommand list = service.disclosureAjax();
		
		m.addAttribute("list",list);
	
		System.out.println(list);
		return list;
	}
	
	@GetMapping("/disclosure")
	public String disclosurePage() {
		
		return "disclosure/disclosure";
	}

}
