package com.example.project.model.member.dao;


import com.example.project.model.member.dto.MemberDTO;

public interface MemberDAO {
	public String loginCheck(MemberDTO dto);

	public void insertMember(MemberDTO dto);

	public int useridCheck(String userid);

}
