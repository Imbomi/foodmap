package com.example.project.model.restaurant.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.restaurant.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReplyDTO> list(Integer rt_idx, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("rt_idx", rt_idx);
		return sqlSession.selectList("reply.listReply", map);
	}

	@Override
	public int count(int rt_idx) {
		return sqlSession.selectOne("reply.count", rt_idx);
	}

	@Override
	public void create(ReplyDTO dto) {
		sqlSession.insert("reply.insertReply", dto);
	}

	@Override
	public void update(ReplyDTO dto) {
		sqlSession.update("reply.update", dto);
	}

	@Override
	public void delete(Integer reply_idx) {
		sqlSession.delete("reply.delete", reply_idx);
	}

	@Override
	public ReplyDTO detail(int reply_idx) {
		return sqlSession.selectOne("reply.detail", reply_idx);
	}

}
