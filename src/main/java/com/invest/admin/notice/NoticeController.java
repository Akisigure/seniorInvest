package com.invest.admin.notice;

import com.invest.admin.notice.NoticeDto;
import com.invest.admin.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notices")
    public List<NoticeDto> getAllNotices() {
        return noticeService.getAllNotices();
    }

    @GetMapping("/notices/{id}")
    public NoticeDto getNotice(@PathVariable int id) {
        return noticeService.getNotice(id);
    }

    @PostMapping("/notices")
    public void addNotice(@RequestBody NoticeDto notice) {
        noticeService.addNotice(notice);
    }

    @PutMapping("/notices/{id}")
    public void updateNotice(@PathVariable int id, @RequestBody NoticeDto notice) {
        noticeService.updateNotice(notice);
    }

    @DeleteMapping("/notices/{id}")
    public void deleteNotice(@PathVariable int id) {
        noticeService.deleteNotice(id);
    }
}
