package com.invest.admin.header;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHeaderController {

    @GetMapping("/adminheader")
    public String getAdminHeader() {
        return "admin/adminheader";
    }
}

