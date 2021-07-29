package com.example.project.model.restaurant.dao;

import java.util.List;

import com.example.project.model.restaurant.dto.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(Integer rt_idx,int start, int end);
	public int count(int rt_idx);
	public void create(ReplyDTO dto);
	public void update(ReplyDTO dto);
	public void delete(Integer reply_idx);
	public ReplyDTO detail(int reply_idx);
}
