package com.example.project.service.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.project.model.notice.dao.NoticeDAO;
import com.example.project.model.notice.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	NoticeDAO noticeDao;

	@Override
	public NoticeDTO checkArticle(NoticeDTO dto) {
		return noticeDao.checkArticle(dto);
	}

	@Override
	public List<NoticeDTO> notice_list(int start, int end) {
		return noticeDao.notice_list(start, end);
	}

	@Override
	public String getFileName(int notice_idx) {
		return noticeDao.getFileName(notice_idx);
	}

	@Override
	public void plusDown(int notice_idx) {
		noticeDao.plusDown(notice_idx);		
	}

	@Override
	public void update(NoticeDTO dto) throws Exception{
		noticeDao.update(dto);
	}

	@Override
	public void delete(int notice_idx) {
		noticeDao.delete(notice_idx);
	}

	@Override
	public int count() {
		return noticeDao.count();
	}

	@Transactional
	@Override
	public void insert(NoticeDTO dto) throws Exception {
		noticeDao.insert(dto);
		
	}

	@Override
	public void plusReadCount(int notice_idx, HttpSession count_session) {
		noticeDao.plusReadCount(notice_idx, count_session);
	}

	@Override
	public NoticeDTO view(int notice_idx) {
		return noticeDao.view(notice_idx);
	}

	
	@Override
	public List<String> getAttach(int notice_idx) {
		return noticeDao.getAttach(notice_idx);
	}
	@Override
	public void deleteFile(String fullName) {
		noticeDao.deleteFile(fullName);
	}
}
