package com.example.project.model.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import com.example.project.model.notice.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	SqlSession sqlSession;

	public NoticeDTO checkArticle(NoticeDTO dto) {
		String writer = dto.getWriter();
		writer = writer.replace("<", "&lt;");
		writer = writer.replace(">", "&gt;");
		// }
		String title = dto.getTitle();
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		// }
		String content = dto.getContent();
		if (content != null) {
			content = content.replace("<", "&lt;");
			content = content.replace(">", "&gt;");
			content = content.replace(" ", "&nbsp;&nbsp;");
			content = content.replace("\n", "<br>");
		}
		writer = writer.replace(" ", "&nbsp;&nbsp;");
		title = title.replace(" ", "&nbsp;&nbsp;");
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		return dto;
	}

	public List<NoticeDTO> notice_list(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("notice.notice_list", map);
	}

	public String getFileName(int notice_idx) {
		return  sqlSession.selectOne("notice.getFileName", notice_idx);
	}

	public void plusDown(int notice_idx) {
			sqlSession.update("notice.plusDown", notice_idx);
	}

	public void update(NoticeDTO dto) throws Exception {
		sqlSession.update("notice.update", dto);
	}

	public void delete(int notice_idx) {
		sqlSession.delete("notice.delete", notice_idx);
	}

	public int count() {
		return sqlSession.selectOne("notice.notice_count");
	}

	public void insert(NoticeDTO dto) throws Exception {
		sqlSession.insert("notice.notice_insert", dto);
	}

	public void plusReadCount(int notice_idx, HttpSession count_session) {
		long read_time = 0;
		// 게시물을 최근에 열람한 시간 확인
		if (count_session.getAttribute("read_time_" + notice_idx) != null) {
			read_time = (Long) count_session.getAttribute("read_time_" + notice_idx);
		}
		long current_time = System.currentTimeMillis(); // 현재 시각
		// 조회수 증가 처리할 시간 설정
		if (current_time - read_time > 5 * 1000) {
			sqlSession.update("notice.plusReadCount", notice_idx); // 조회수 증가 처리
			count_session.setAttribute("read_time_" + notice_idx, current_time);
		}
	}

	public NoticeDTO view(int notice_idx) {
		return sqlSession.selectOne("notice.view", notice_idx);
	}
	
	@Override
	public void addAttach(String filename) { //첨부파일 저장
		sqlSession.insert("notice.addAttach", filename);
	}
	
	@Override
	public void updateAttach(String fullName, int notice_idx) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("fullName", fullName);
		map.put("notice_idx", notice_idx);
		sqlSession.insert("notice.updateAttach",map);
	}
	
	@Override
	public List<String> getAttach(int notice_idx) {
		return sqlSession.selectList("notice.getAttach",notice_idx); //첨부파일 수정
	}
	
	@Override
	public void deleteFile(String fullName) {
		sqlSession.delete("notice.deleteAttach",fullName);
	}

	//json parsing 할때
	@Override
	public JSONObject list_json(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<NoticeDTO> items=sqlSession.selectList("notice.notice_list",map);
		JSONObject jsonMain = new JSONObject(); // 객체
		JSONArray jArray = new JSONArray(); // 배열
		int count=0;
		for(NoticeDTO dto : items) {
		JSONObject jsonObj = new JSONObject(); // JSON내용을 담을 객체
		jsonObj.put("notice_idx", dto.getNotice_idx());
		jsonObj.put("writer", dto.getWriter());
		jsonObj.put("title", dto.getTitle());
//		jsonObj.put("content", dto.getContent());
		jsonObj.put("regdate", dto.getRegdate());
		jsonObj.put("readcount", dto.getReadcount());
		jsonObj.put("file", dto.getFile());
		jsonObj.put("filename", dto.getFilename());
		jsonObj.put("filesize", dto.getFilesize());
		jsonObj.put("down", dto.getDown());
		jArray.add(count, jsonObj);
		count++;
		}
		jsonMain.put("sendData", jArray); // JSON의 제목 지정
		return jsonMain;
	}
}