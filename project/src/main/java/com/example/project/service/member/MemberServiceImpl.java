package com.example.project.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.member.dao.MemberDAO;
import com.example.project.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO memberDao;

	@Override
	public String loginCheck(MemberDTO dto, HttpSession session) {
		String name = memberDao.loginCheck(dto);
		if (name != null) { // 세션 변수 저장
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", name);
		}
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();

	}

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}

	@Override
	public int useridCheck(String userid) {
		return memberDao.useridCheck(userid);
	}

}
