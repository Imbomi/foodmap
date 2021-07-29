package com.example.project.controller.good;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.good.dto.GoodDTO;
import com.example.project.pager.Pager;
import com.example.project.service.good.GoodService;
import com.example.project.service.restaurant.RestaurantService;

@Controller
@RequestMapping("/good/*")
public class GoodController {

	@Inject
	GoodService goodService;

	@Inject
	RestaurantService r_service;

	@RequestMapping("delete.do")
	public String delete(@RequestParam int good_idx, @RequestParam int rt_idx) {
		goodService.delete(good_idx);
		r_service.goodCount(rt_idx);
		return "redirect:/good/list.do";
	}

	@RequestMapping("deleteAll.do")
	public String deleteAll(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			goodService.deleteAll(userid);
		}
		return "redirect:/good/list.do";
	}

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage, HttpSession session, ModelAndView mav) {
		int user_good = goodService.count((String) session.getAttribute("userid"));
		Pager pager = new Pager(user_good, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		Map<String, Object> map = new HashMap<>();
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			List<GoodDTO> list = goodService.listGood(start, end, userid);
			map.put("list", list); // 좋아요 목록
			map.put("page", pager);
			map.put("user_good", user_good);
			mav.setViewName("fm/fm_good-list");// 뷰의 이름
			mav.addObject("map", map);// 뷰에 전달할 데이터
			return mav;
		} else { // 로그인하지 않은 경우
			return new ModelAndView("fm/fm_login", "", null);
		}
	}

	@RequestMapping("insert.do/{rt_idx}")
	public String insert(@PathVariable("rt_idx") int rt_idx, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		String userid = (String) session.getAttribute("userid");
		if (goodService.goodcheck(rt_idx, userid) == 1) {
			map.put("message", "error");
			return "redirect:/good/list.do";
		}
		if (userid == null) {
			return "redirect:/member/login.do";
		}
		map.put("userid", userid);
		map.put("rt_idx", rt_idx);
		goodService.insert(map);
		r_service.goodCount(rt_idx);
		return "redirect:/good/list.do";
	}

}
