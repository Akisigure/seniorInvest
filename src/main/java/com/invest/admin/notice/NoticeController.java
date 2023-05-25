package com.invest.admin.notice;

import com.invest.admin.notice.NoticeDto;
import com.invest.admin.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/notices")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;


}
