package com.example.project.service.restaurant;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.restaurant.dto.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(Integer rt_idx, int start, int end, HttpSession session);

	public int count(int rt_idx);

	public void create(ReplyDTO dto);

	public void update(ReplyDTO dto);

	public void delete(Integer reply_idx);

	// 댓글의 상세정보
	public ReplyDTO detail(int reply_idx);
}
