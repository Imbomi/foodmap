package com.example.project.controller.notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.common.Constants;
import com.example.project.model.notice.dao.NoticeDAO;
import com.example.project.model.notice.dto.NoticeDTO;
import com.example.project.pager.Pager;
import com.example.project.service.notice.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	NoticeService noticeService;

	@Inject
	NoticeDAO noticeDao;

	@Inject
	HttpServletRequest request;

	@RequestMapping("notice_list.do")
	public ModelAndView notice_list(@RequestParam(defaultValue = "1") int curPage) {
		int count = noticeDao.count(); // 레코드 개수 계산
		// 페이지 번호
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin(); // 레코드 시작 번호
		int end = pager.getPageEnd(); // 레코드 끝번호
		List<NoticeDTO> list = noticeService.notice_list(start, end);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/fm/fm_notice");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("page", pager);
		mav.addObject("map", map);
		return mav;

	}

	@RequestMapping("notice_write.do") // write 페이지로 이동
	public String notice_write() {
		return "fm/fm_notice-write";
	}

	@RequestMapping("notice_insert.do")
	public String notice_insert(NoticeDTO dto, HttpSession session) throws Exception {
		String filename = "";
		dto = noticeService.checkArticle(dto);
		if (!dto.getFile().isEmpty()) { // 첨부파일 존재하면,
			filename = dto.getFile().getOriginalFilename(); // 파일 이름 가져오기
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/WEB-INF/views/images/");
				new File(path).mkdir();
				dto.getFile().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setFilename(filename);
		// 상품정보를 레코드에 저장
		noticeService.insert(dto);
		return "redirect:/notice/notice_list.do";
	}

	@RequestMapping("view/{notice_idx}")
	public ModelAndView view(@PathVariable int notice_idx, ModelAndView mav) {
		// 세션객체를 만들고
		HttpSession session = request.getSession();
		// 조회수 증가 처리
		noticeDao.plusReadCount(notice_idx, session);
		mav.setViewName("/fm/fm_notice-view");
		mav.addObject("dto", noticeService.view(notice_idx));
		return mav;

	}

	@RequestMapping("download.do")
	public void download(HttpServletResponse response) throws IOException {
		ServletContext application = request.getSession().getServletContext();
		String path = application.getRealPath("/WEB-INF/views/images/");
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));// 게시물 번호
		String filename = noticeDao.getFileName(notice_idx);// 첨부파일의 이름

		byte b[] = new byte[4096];// 바이트 배열
		FileInputStream fis = new FileInputStream(path + filename);// 스트림을 생성

		// 파일 이름이 깨지지 않도록 처리
		filename = new String(filename.getBytes("utf-8"), "8859_1"); // 헤더구성
		response.setHeader("Content-Disposition", "attachment;filename=" + filename); // 출력 스트림 생성
		ServletOutputStream out = response.getOutputStream();
		int numRead;
		while (true) {
			numRead = fis.read(b, 0, b.length); // 서버에서 읽어서
			if (numRead == -1)
				break; // 내용이 없으면 종료
			out.write(b, 0, numRead); // 클라이언트에 업로드
		}
		out.flush(); // 버퍼 클리어 out.close();
		fis.close();
		noticeDao.plusDown(notice_idx); // 다운로드 횟수 증가 처리
	}

	@RequestMapping("update.do")
	public String update(@ModelAttribute NoticeDTO dto, @RequestParam(defaultValue="0") String fileDel) throws Exception {
		String filename = "";
		dto = noticeService.checkArticle(dto);
		if (!dto.getFile().isEmpty()) { // 첨부파일 존재하면,
			filename = dto.getFile().getOriginalFilename();
			try {
				// 배포 디렉토리
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/WEB-INF/views/images/");
				// 디렉토리 생성
				new File(path).mkdir();
				// 업로드된 임시파일을 원하는 디렉토리로 복사
				dto.getFile().transferTo(new File(path + filename));
				dto.setFilename(filename);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { // 새로운 파일 첨부가 없을 때
			// 기존의 첨부파일 정보가 지워지지 않도록 처리
			NoticeDTO dto2 = noticeService.view(dto.getNotice_idx());
			dto.setFilename(dto2.getFilename()); // 원래 저장되어있던 파일 불러와서 file에 set
		}
		
		System.out.println("fileDel" + fileDel);
		if (fileDel.equals("1")) { // 삭제하기로 체크되면, 원래 파일 없애야함. //null이면 삭제 안하기로 한거~
			String fileName = dto.getFilename();
			File f = new File(Constants.UPLOAD_PATH + fileName);
			f.delete(); // 파일 삭제
		}
		noticeService.update(dto);
		return "redirect:/notice/notice_list.do";

	}

	@RequestMapping("delete.do")
	public String delete(@RequestParam int notice_idx) {
		noticeService.delete(notice_idx);
		return "redirect:/notice/notice_list.do";
	}

	@RequestMapping("edit/{notice_idx}")
	public ModelAndView edit(@PathVariable("notice_idx") int notice_idx, ModelAndView mav) {
		mav.setViewName("fm/fm_notice-edit");
		NoticeDTO result = noticeService.view(notice_idx);
		String cont = result.getContent().replace("<br>", "\n");
		result.setContent(cont);
		mav.addObject("dto", result);
		return mav;
	}
	
	@RequestMapping("notice_list_json.do")
	@ResponseBody
	public JSONObject notice_list_json(@RequestParam(defaultValue = "1") int curPage, Model model) {
		int count = noticeDao.count(); // 레코드 개수 계산
		// 페이지 번호
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin(); // 레코드 시작 번호
		int end = pager.getPageEnd(); // 레코드 끝번호
		return noticeDao.list_json(start,end);
	}

}
