package com.example.project.model.good.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.good.dto.GoodDTO;

@Repository
public class GoodDAOImpl implements GoodDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<GoodDTO> cartMoney() {
		return sqlSession.selectList("good.cart_money");
	}

	@Override
	public void insert(Map<String, Object> map) {
		sqlSession.insert("good.insert", map);
	}

	@Override
	public List<GoodDTO> listGood(int start, int end, String userid) {
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("userid", userid);
		return sqlSession.selectList("good.listGood",map);
	}

	@Override
	public void delete(int good_idx) {
		sqlSession.delete("good.delete", good_idx);
	}

	@Override
	public void deleteAll(String userid) {
		sqlSession.delete("good.deleteAll", userid);
	}

	
	@Override
	public void modifyCart(GoodDTO dto) {
	sqlSession.update("good.modify", dto);
	}

	@Override
	public int count(String userid) {
		return sqlSession.selectOne("good.count",userid);
	}

	@Override
	public int goodcheck(int rt_idx, String userid) {
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("rt_idx", rt_idx);
		map.put("userid", userid);
		return sqlSession.selectOne("good.goodcheck",map);
	}

}
