package com.example.project.model.admin;

import com.example.project.model.member.dto.MemberDTO;

public interface AdminDAO {
	public String loginCheck(MemberDTO dto);

	public int useridCheck(String userid);
}
