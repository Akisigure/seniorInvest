package com.invest.admin.notice;

import com.invest.admin.notice.NoticeDao;
import com.invest.admin.notice.NoticeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    public List<NoticeDto> getAllNotices() {
        return noticeDao.selectAllNotices();
    }

    public NoticeDto getNotice(int id) {
        return noticeDao.selectNoticeById(id);
    }

    public void addNotice(NoticeDto notice) {
        noticeDao.insertNotice(notice);
    }

    public void updateNotice(NoticeDto notice) {
        noticeDao.updateNotice(notice);
    }

    public void deleteNotice(int id) {
        noticeDao.deleteNotice(id);
    }
}
