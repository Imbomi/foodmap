package com.example.project.service.member;

import javax.servlet.http.HttpSession;

import com.example.project.model.member.dto.MemberDTO;

public interface MemberService {
	public String loginCheck(MemberDTO dto, HttpSession session);

	public void logout(HttpSession session);

	public void insertMember(MemberDTO dto);

	public int useridCheck(String userid);

}
