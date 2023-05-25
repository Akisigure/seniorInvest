package com.invest.admin.notice;

import com.invest.admin.notice.NoticeDto;
import com.invest.admin.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
// @RequestMapping("/notices")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("admin/notices/form")
    public String showNoticeForm() {
        return "notice/noticeWriter";
    }

    @GetMapping
    public String getAllNotices(Model model) {
        List<NoticeDto> notices = noticeService.getAllNotices();
        model.addAttribute("notices", notices);
        return "notice/noticesWriter";
    }

    @GetMapping("/{id}")
    public String getNotice(@PathVariable int id, Model model) {
        NoticeDto notice = noticeService.getNotice(id);
        model.addAttribute("notice", notice);
        return "notice/notice";
    }

    @PostMapping
    public String addNotice(@RequestBody NoticeDto notice) {
        noticeService.addNotice(notice);
        return "redirect:/notices";
    }

    @PutMapping("/{id}")
    public String updateNotice(@PathVariable int id, @ModelAttribute NoticeDto notice) {
        notice.setId(id);
        noticeService.updateNotice(notice);
        return "redirect:/notices";
    }

    @DeleteMapping("/{id}")
    public String deleteNotice(@PathVariable int id) {
        noticeService.deleteNotice(id);
        return "redirect:/notices";
    }
    
    @GetMapping("/notices")
    public String noticePage() {
    	return "notice/notice";
    }
}
