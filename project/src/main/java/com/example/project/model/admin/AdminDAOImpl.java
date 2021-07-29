package com.example.project.model.admin;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.member.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sqlSession;
	
	public String loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("admin.login_check", dto);
	}

	@Override
	public int useridCheck(String userid) {
		return sqlSession.selectOne("admin.useridCheck",userid);
	}
}
