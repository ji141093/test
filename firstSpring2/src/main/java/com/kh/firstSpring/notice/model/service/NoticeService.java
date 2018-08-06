package com.kh.firstSpring.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstSpring.notice.model.dao.NoticeDao;
import com.kh.firstSpring.notice.model.vo.Notice;

@Service
public class NoticeService {
	@Autowired
	NoticeDao dao;
	
	public List<Notice> selectNoticeList() {
		return dao.selectNoticeList();
	}

	public Notice selectNotice(int no) {
		return dao.selectNotice(no);
	}

	public int insertNotice(Notice notice) throws Exception {
		/*dao.insertNotice(notice);
		return dao.insertNotice2(notice);*/
		return dao.insertNotice(notice);
	}

	public int updateNotice(Notice notice) {
		return dao.updateNotice(notice);
	}

	public int deleteNotice(Notice notice) {
		return dao.deleteNotice(notice);
	}

}
