package com.example.project.service.restaurant;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.restaurant.dto.RestaurantDTO;

public interface RestaurantService {

	RestaurantDTO checkArticle(RestaurantDTO dto);
	List<RestaurantDTO> resto_list(int start, int end, String category, String restaurant, String writer, String orderBy);
	RestaurantDTO view(int rt_idx);
	void goodCount(int rt_idx);
	void plusReadCount(int rt_idx, HttpSession count_session);
	void insert(RestaurantDTO dto);
	void update(RestaurantDTO dto);
	void delete(int rt_idx);
	//
	int count(String category, String restaurant, String writer);
	//
	String getFile(int rt_idx);
	//
	void updateStep(int ref, int re_step);
	void reply(RestaurantDTO dto);
	public int countArticle(String category, String restaurant, String writer) throws Exception;
}
