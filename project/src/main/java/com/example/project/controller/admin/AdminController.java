package com.example.project.controller.admin;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dto.MemberDTO;
import com.example.project.model.restaurant.dto.RestaurantDTO;
import com.example.project.service.admin.AdminService;
import com.example.project.service.restaurant.RestaurantService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Inject
	AdminService adminService;
	
	@Inject
	RestaurantService service;

// 관리자 로그인 폼으로 이동
	@RequestMapping("login.do")
	public String login() {
		return "fm/fm_admin-login";
	}

// 로그인 체크 로직
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session, ModelAndView mav, @RequestParam(defaultValue="OrderByLikes") String orderBy) {
		String name = adminService.loginCheck(dto);
		System.out.println(dto);
		if (name != null) { // 로그인 성공
//관리자 세션 변수 추가
			List<RestaurantDTO> list=service.resto_list(1, 4, "All","","",orderBy);
			session.setAttribute("admin_userid", dto.getUserid());
			session.setAttribute("admin_name", name);
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", name);
			mav.setViewName("fm/fm_main");
			mav.addObject("list", list);
			mav.addObject("message", "success");
		} else { // 로그인 실패
			mav.setViewName("fm/fm_admin-login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
//세션 정보를 초기화시킴(모든 세션변수 삭제)
		session.invalidate();
		return "redirect:/admin/login.do";
	}

}









