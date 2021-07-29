package com.example.project.controller.restaurant;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.restaurant.dto.ReplyDTO;
import com.example.project.pager.Pager;
import com.example.project.pager.Pager_reply;
import com.example.project.service.restaurant.ReplyService;

@RestController //리턴타입 변수 가능
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	ReplyService replyService;

	@RequestMapping("insert.do") //웹플젝엔 이거
	public void insert(@ModelAttribute ReplyDTO dto, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		dto.setReplyer(userid);
		replyService.create(dto); //댓글 저장
	}

	@RequestMapping(value = "/delete/{reply_idx}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("reply_idx") int reply_idx) {
		ResponseEntity<String> entity = null;
		try {
			replyService.delete(reply_idx);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
//	//rest 방식의 댓글쓰기(json 데이터가 전달됨). 자바스크립트 객체를 전달. insert.do 랑 같은 기능인데 방법이 다름
//	@RequestMapping(value = "insert_rest.do", method = RequestMethod.POST)
//	public ResponseEntity<String> insert_rest(@RequestBody ReplyDTO dto, HttpSession session) {
//		ResponseEntity<String> entity = null;
//		try {
//			String userid = (String) session.getAttribute("userid");
//			// String userid="kim";
//			dto.setReplyer(userid);
//			replyService.create(dto);
//			entity = new ResponseEntity<String>("success", HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}

	@RequestMapping(value = "/detail/{reply_idx}", method = RequestMethod.GET)
	public ModelAndView reply_detail(@PathVariable("reply_idx") int reply_idx, ModelAndView mav) {
		ReplyDTO dto = replyService.detail(reply_idx); //댓글 상세 내용
		mav.setViewName("fm/fm_reply-detail");
		mav.addObject("dto", dto);
		return mav;
	}

	//rest 방식의 url. :url에 고유한 번호를 집어넣어버리는 방법 ==>웹플젝으로 이거 씀
	@RequestMapping(value = "/list/{rt_idx}/{curPage}", method = RequestMethod.GET)
	public ModelAndView reply_list(@PathVariable("rt_idx") int rt_idx, @PathVariable int curPage, ModelAndView mav,
			HttpSession session) {
		int count = replyService.count(rt_idx); // 댓글 갯수
		Pager_reply pager = new Pager_reply(count, curPage); //댓글 갯수 센걸 기반으로 페이지 나누기
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ReplyDTO> list = replyService.list(rt_idx, start, end, session);
		// 뷰의 이름 지정
		// WEB-INF/views/board/reply_list.jsp
		mav.setViewName("fm/fm_reply-list");
		// 뷰에 전달할 데이터 저장
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		// reply_list.jsp로 포워딩
		return mav;
	}

	// url에 파라미터를 전달해주는 방식. 위에꺼랑 똑같은 거. 방식만 다름
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam int rt_idx, @RequestParam(defaultValue = "1") int curPage, ModelAndView mav,
			HttpSession session) {
		int count = replyService.count(rt_idx); // 댓글 갯수
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ReplyDTO> list = replyService.list(rt_idx, start, end, session);
		// 뷰의 이름 지정
		// WEB-INF/views/board/reply_list.jsp
		mav.setViewName("restaurant/fm_reply_list");
		// 뷰에 전달할 데이터 저장
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		// reply_list.jsp로 포워딩
		return mav;
	}

	//put: 전체내용 수정, patch: 일부 내용 수정. 그냥 post방식으로 해도 무난... json 형식으로 전달이 됨.
	@RequestMapping(value = "/update/{reply_idx}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("reply_idx") int reply_idx, @RequestBody ReplyDTO dto) {
		ResponseEntity<String> entity = null;
		try {
			dto.setReply_idx(reply_idx);
			// 서비스 호출
			replyService.update(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//댓글 내용을 json 형식으로 리턴하는 방식
	@RequestMapping("list_json.do")
	public @ResponseBody List<ReplyDTO> list_json(@RequestParam(defaultValue = "1") int curPage, @RequestParam int rt_idx,
			HttpSession session) {
		int count = 10; // 댓글 갯수
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ReplyDTO> list = replyService.list(rt_idx, start, end, session);
		return list;
	}

}
