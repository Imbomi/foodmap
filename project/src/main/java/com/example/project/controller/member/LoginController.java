package com.example.project.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dto.MemberDTO;
import com.example.project.model.restaurant.dto.RestaurantDTO;
import com.example.project.service.member.MemberService;
import com.example.project.service.restaurant.RestaurantService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Inject
	RestaurantService service;
	
	@Inject
	MemberService memberService;

	@RequestMapping("login.do")
	public String login() {
		return "fm/fm_login";
	}

	@RequestMapping("login_check.do")
	public ModelAndView login_check(@ModelAttribute MemberDTO dto, HttpSession session, @RequestParam(defaultValue="OrderByLikes") String orderBy) {
		String name = memberService.loginCheck(dto, session);
		System.out.println(dto);
		ModelAndView mav = new ModelAndView();
		if (name != null) { // 로그인 성공
			List<RestaurantDTO> list=service.resto_list(1, 4, "All","","",orderBy);
			mav.addObject("list", list);
			mav.setViewName("fm/fm_main");
		} else { // 로그인 실패
			mav.addObject("message", "error");
			mav.setViewName("fm/fm_login");
		}
		return mav;
	}

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);
		mav.setViewName("fm/fm_login");
		mav.addObject("message", "logout");
		return mav;
	}
	
	@RequestMapping("mypage_check.do")
	public String mypage_check() {
		return "fm/fm_mypage-check";
	}
}







