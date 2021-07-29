package com.example.project.controller.restaurant;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.restaurant.dto.RestaurantDTO;
import com.example.project.pager.Pager_resto;
import com.example.project.service.good.GoodService;
import com.example.project.service.restaurant.ReplyService;
import com.example.project.service.restaurant.RestaurantService;

@Controller
@RequestMapping("/restaurant/*")
public class RestaurantController {
	@Inject
	RestaurantService service;
	
	@Inject
	ReplyService replyService;
	
	@Inject
	GoodService goodService;

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "All") String category, @RequestParam(defaultValue = "") String restaurant
			, @RequestParam(defaultValue = "") String writer, @RequestParam(defaultValue="OrderByLikes") String orderBy)
			throws Exception { // 페이지 나누기, 검색기능 추가해야함
		int count = service.count(category,restaurant,writer);
		Pager_resto pager = new Pager_resto(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<RestaurantDTO> list=service.resto_list(start, end, category,restaurant,writer,orderBy);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/fm/fm_restaurant");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		//map.put("reply_count", reply_count);
		map.put("category", category);
		map.put("restaurant", restaurant);
		map.put("writer", writer);
		map.put("page", pager);
		mav.addObject("map", map);
		
		return mav;
	}
	

	@RequestMapping("view.do/{rt_idx}")
	public ModelAndView detail(@PathVariable int rt_idx, ModelAndView mav, HttpSession session) {
		int reply_count = replyService.count(rt_idx);
		String userid = (String) session.getAttribute("userid");
		if(userid!=null) {
		int goodcheck=goodService.goodcheck(rt_idx, userid);
		mav.addObject("goodcheck",goodcheck);
		}
		mav.setViewName("/fm/fm_restaurant-view");
		mav.addObject("reply_count",reply_count);
		mav.addObject("dto", service.view(rt_idx));
		return mav;
	}

	@RequestMapping("write.do")
	public String write() {
		return "fm/fm_restaurant-write";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute RestaurantDTO dto, HttpServletRequest request) {
		String filename = "-";
		if (!dto.getFile().isEmpty()) { // 첨부파일 존재
			dto=service.checkArticle(dto);
			filename = dto.getFile().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/WEB-INF/views/images/");
				// 디렉토리 생성
				new File(path).mkdir();
				// 업로드된 임시파일을 원하는 디렉토리로 복사
				dto.getFile().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setPicture_url(filename);
		// 상품정보를 레코드에 저장
		service.insert(dto);
		// 상품 목록 페이지로 이동
		return "redirect:/restaurant/list.do";
	}

	@RequestMapping("edit.do/{rt_idx}")
	public ModelAndView edit(@PathVariable("rt_idx") int rt_idx, ModelAndView mav) {
		RestaurantDTO result=service.view(rt_idx);
		
		String content=result.getRt_content().replace("<br>", "\n");
		result.setRt_content(content);
		String summary=result.getRt_summary().replace("<br>", "\n");
		result.setRt_summary(summary);
		
		mav.setViewName("fm/fm_restaurant-edit");
		mav.addObject("dto", result);
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(@ModelAttribute RestaurantDTO dto, HttpServletRequest request) {
		String filename = "-";
		dto=service.checkArticle(dto);
		if (!dto.getFile().isEmpty()) { // 첨부파일 존재
			filename = dto.getFile().getOriginalFilename();
			try {
				// 배포 디렉토리
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/WEB-INF/views/images/");
				// 디렉토리 생성
				new File(path).mkdir();
				// 업로드된 임시파일을 원하는 디렉토리로 복사
				dto.getFile().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setPicture_url(filename);
		} else { // 새로운 파일 첨부가 없을 때
			// 기존의 첨부파일 정보가 지워지지 않도록 처리
			RestaurantDTO dto2 = service.view(dto.getRt_idx());
			dto.setPicture_url(dto2.getPicture_url());
		}
		// 상품정보 수정
		service.update(dto);
		// 상품 목록 페이지로 이동
		return "redirect:/restaurant/view.do/"+dto.getRt_idx();
	}

	@RequestMapping("delete.do")
	public String delete(@RequestParam int rt_idx, HttpServletRequest request) {
		String filename = service.getFile(rt_idx);
		if (filename != null && !filename.equals("-")) { // 첨부파일이 존재하면
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/WEB-INF/views/images/");
			File f = new File(path + filename);
			if (f.exists()) { // 파일이 존재하면
				f.delete(); // 파일 삭제
			}
		}
		service.delete(rt_idx);
		return "redirect:/restaurant/list.do";
	}
	
	@RequestMapping("showmap.do")
	public ModelAndView showmap(@RequestParam String address, ModelAndView mav) {
		mav.setViewName("fm/fm_foodmap");
		mav.addObject("resto_address",address);
		return mav;
	}

}
