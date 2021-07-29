package com.example.project.service.good;

import java.util.List;
import java.util.Map;

import com.example.project.model.good.dto.GoodDTO;

public interface GoodService {
	int goodcheck = 0;
	public List<GoodDTO> cartMoney();
	public void insert(Map<String, Object> map);
	public List<GoodDTO> listGood(int start, int end, String userid);
	public void delete(int good_idx);
	public void deleteAll(String userid);
	public void modifyCart(GoodDTO dto);
	public int count(String userid);
	public int goodcheck(int rt_idx, String userid);
}
