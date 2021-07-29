package com.example.project.service.restaurant;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.restaurant.dao.RestaurantDAO;
import com.example.project.model.restaurant.dto.RestaurantDTO;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Inject
	RestaurantDAO restaurantDao;

	@Override
	public int countArticle(String category, String restaurant, String writer) throws Exception {
		return restaurantDao.countArticle(category, restaurant,writer);
	}
	
	@Override
	public RestaurantDTO checkArticle(RestaurantDTO dto) {
		return restaurantDao.checkArticle(dto);
	}

	@Override
	public List<RestaurantDTO> resto_list(int start, int end, String category, String restaurant, String writer, String orderBy) {
		return restaurantDao.resto_list(start, end,category,restaurant,writer,orderBy);
	}

	@Override
	public RestaurantDTO view(int rt_idx) {
		return restaurantDao.view(rt_idx);
	}

	@Override
	public void goodCount(int rt_idx) {
		restaurantDao.goodCount(rt_idx);
	}

	@Override
	public void plusReadCount(int rt_idx, HttpSession count_session) {
		restaurantDao.plusReadCount(rt_idx, count_session);
	}

	@Override
	public void insert(RestaurantDTO dto) {
		restaurantDao.insert(dto);
	}

	@Override
	public void update(RestaurantDTO dto) {
		restaurantDao.update(dto);
	}

	@Override
	public void delete(int rt_idx) {
		restaurantDao.delete(rt_idx);
	}

	@Override
	public int count(String category, String restaurant, String writer) {
		return restaurantDao.count(category,restaurant,writer);
	}

	@Override
	public String getFile(int rt_idx) {
		return restaurantDao.getFile(rt_idx);
	}

	@Override
	public void updateStep(int ref, int re_step) {
		restaurantDao.updateStep(ref, re_step);
	}

	@Override
	public void reply(RestaurantDTO dto) {
		restaurantDao.reply(dto);
	}

}
