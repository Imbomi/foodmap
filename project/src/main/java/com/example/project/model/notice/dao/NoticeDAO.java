package com.example.project.model.notice.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.example.project.model.notice.dto.NoticeDTO;

public interface NoticeDAO {
	 NoticeDTO checkArticle(NoticeDTO dto);
	 List<NoticeDTO> notice_list(int start, int end);
	 String getFileName(int notice_idx);
	 void plusDown(int notice_idx);
	 void update(NoticeDTO dto) throws Exception;
	 void delete(int notice_idx);
	 int count();
	 void insert(NoticeDTO dto) throws Exception;
	 void plusReadCount(int notice_idx, HttpSession count_session);
	 NoticeDTO view(int notice_idx);
	 public void addAttach(String fullName); // 첨부파일 저장
	void updateAttach(String fullName, int notice_idx);
	List<String> getAttach(int notice_idx);
	void deleteFile(String fullName);
	JSONObject list_json(int start, int end);
}
