package com.example.project.controller.main;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.restaurant.dto.RestaurantDTO;
import com.example.project.service.restaurant.RestaurantService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	@Inject
	RestaurantService service;

	@RequestMapping("main.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "All") String category, @RequestParam(defaultValue = "") String restaurant
			, @RequestParam(defaultValue = "") String writer, @RequestParam(defaultValue="OrderByLikes") String orderBy)
			throws Exception { 
		int count = service.count(category,restaurant,writer);
		
		List<RestaurantDTO> list=service.resto_list(1, 4, category,restaurant,writer,orderBy);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("fm/fm_main");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "fm/fm_login";
	}
	
	@RequestMapping("admin_login.do")
	public String admin_login() {
		return "fm/fm_admin-login";
	}
	
	@RequestMapping("logout.do")
	public String logout() {
		return "fm/fm_admin-login";
	}

	@RequestMapping("restaurant_list.do")
	public String restaurant_list() {
		return "fm/fm_restaurant-main";
	}
	
	@RequestMapping("foodmap.do")
	public String food() {
		return "fm/fm_foodmap";
	}
}
