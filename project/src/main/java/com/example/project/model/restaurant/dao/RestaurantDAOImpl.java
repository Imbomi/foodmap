package com.example.project.model.restaurant.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.project.model.restaurant.dto.RestaurantDTO;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public int countArticle(String category, String restaurant, String writer) throws Exception {
		Map<String,String> map= new HashMap<String,String>();
		map.put("category", category); //검색한후, 그걸로도 페이지 만들어야 하니까..
		map.put("restaurant", restaurant);
		map.put("writer", writer);
		return sqlSession.selectOne( "restaurant.countArticle", map);

	}
	
	@Override
	public RestaurantDTO checkArticle(RestaurantDTO dto) {
		String writer = dto.getWriter();
		writer = writer.replace("<", "&lt;");
		writer = writer.replace(">", "&gt;");
		// }
		String rt_name = dto.getRt_name();
		rt_name = rt_name.replace("<", "&lt;");
		rt_name = rt_name.replace(">", "&gt;");
		// }
		String rt_summary = dto.getRt_summary();
		rt_summary = rt_summary.replace("<", "&lt;");
		rt_summary = rt_summary.replace(">", "&gt;");
		rt_summary = rt_summary.replace(" ", "&nbsp;&nbsp;");
		rt_summary = rt_summary.replace("\n", "<br>");
		// }
		String rt_content = dto.getRt_content();
		if (rt_content != null) {
			rt_content = rt_content.replace("<", "&lt;");
			rt_content = rt_content.replace(">", "&gt;");
			rt_content = rt_content.replace(" ", "&nbsp;&nbsp;");
			rt_content = rt_content.replace("\n", "<br>");
		}
		writer = writer.replace(" ", "&nbsp;&nbsp;");
		rt_summary = rt_summary.replace(" ", "&nbsp;&nbsp;");
		dto.setWriter(writer);
		dto.setRt_summary(rt_summary);
		dto.setRt_content(rt_content);
		return dto;
	}

	@Override
	public List<RestaurantDTO> resto_list(int start, int end, String category, String restaurant, String writer, String orderBy) {
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("category", category);
		map.put("restaurant", restaurant);
		map.put("writer", writer);
		
		String a="ppp";
		if(orderBy.equals("OrderByLikes")) {
			a="goodcount";
		}else if(orderBy.equals("OrderByLowPrice")) {
			a="ppp";
		}
		
		map.put("orderBy", a);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("restaurant.resto_list",map);
	}

	@Override
	public RestaurantDTO view(int rt_idx) {
		return sqlSession.selectOne("restaurant.view",rt_idx);
	}

	@Override
	public void goodCount(int rt_idx) {
		sqlSession.update("restaurant.goodCount",rt_idx);
	}

	@Override
	public void plusReadCount(int rt_idx, HttpSession count_session) {
		sqlSession.update("restaurant.plusReadCount",rt_idx);
	}

	@Override
	public void insert(RestaurantDTO dto) {
		sqlSession.insert("restaurant.resto_insert",dto);
	}

	@Override
	public void update(RestaurantDTO dto) {
		sqlSession.update("restaurant.resto_update",dto);
	}

	@Transactional
	@Override
	public void delete(int rt_idx) {
		int reply_count= sqlSession.selectOne("reply.count",rt_idx);
		int good_count= sqlSession.selectOne("good.goodcount",rt_idx);
		if(reply_count>=1) {
			sqlSession.delete("reply.resto_reply_delete",rt_idx);
		}
		if(good_count>=1) {
			sqlSession.delete("good.deleteByResto",rt_idx);
		}
		sqlSession.delete("restaurant.resto_delete",rt_idx);
	}

	@Override
	public int count(String category, String restaurant, String writer) {
		Map<String,String> map= new HashMap<String,String>();
		map.put("category", category); //검색색한후, 그걸로도 페이지 만들어야 하니까..
		map.put("restaurant", restaurant);
		map.put("writer", writer);
		return sqlSession.selectOne("restaurant.count",map);
	}

	@Override
	public String getFile(int rt_idx) {
		return sqlSession.selectOne("restaurant.getFile",rt_idx);
	}

	@Override
	public void updateStep(int ref, int re_step) {

	}

	@Override
	public void reply(RestaurantDTO dto) {

	}

}
