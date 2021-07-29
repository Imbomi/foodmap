package com.example.project.controller.member;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dto.MemberDTO;
import com.example.project.service.admin.AdminService;
import com.example.project.service.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	MemberService memberService;
	@Inject
	AdminService adminService;
	
	@RequestMapping("join.do")
	public String join() {
		return "fm/fm_join";
	}
	
	@RequestMapping("insertMember.do")
	public ModelAndView insertMember(@ModelAttribute MemberDTO dto, ModelAndView mav) {
		memberService.insertMember(dto);
		mav.setViewName("fm/fm_login");
		mav.addObject("success", "Now you're a member of foodmap. please log in to use all features.");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="useridCheck.do",method= RequestMethod.POST)
	public String useridCheck(@RequestParam String userid) {
		int useridCheck1=memberService.useridCheck(userid);
		int useridCheck2=adminService.useridCheck(userid);
		int useridCheck=useridCheck1+useridCheck2;
		String result="";
		if(useridCheck==1) {
			result="It's already in used.";
		}else{
			result="It's available.";
		}
		return result;
	}
	
}
