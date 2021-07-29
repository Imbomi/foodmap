package com.example.project.service.good;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.good.dao.GoodDAO;
import com.example.project.model.good.dto.GoodDTO;
import com.example.project.model.restaurant.dao.RestaurantDAO;

@Service
public class GoodServiceImpl implements GoodService {
	
	@Inject
	GoodDAO goodDao;
	@Inject
	RestaurantDAO restaurantDao;

	@Override
	public List<GoodDTO> cartMoney() {
		return goodDao.cartMoney();
	}

	@Override
	public void insert(Map<String, Object> map) {
		goodDao.insert(map);
	}

	@Override
	public List<GoodDTO> listGood(int start, int end, String userid) {
		return goodDao.listGood(start, end, userid);
	}

	@Override
	public void delete(int good_idx) {
		goodDao.delete(good_idx);
	}

	@Override
	public void deleteAll(String userid) {
		goodDao.deleteAll(userid);
	}

	@Override
	public void modifyCart(GoodDTO dto) {
		goodDao.modifyCart(dto);		
	}

	@Override
	public int count(String userid) {
		return goodDao.count(userid);
	}

	@Override
	public int goodcheck(int rt_idx, String userid) {
		return goodDao.goodcheck(rt_idx,userid);
	}

}
