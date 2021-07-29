package com.example.project.controller.Survey;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.survey.dao.SurveyDAO;
import com.example.project.model.survey.dto.SurveyDTO;
import com.example.project.model.survey.dto.SurveyResultDTO;
import com.example.project.model.survey.dto.SurveySummaryDTO;
import com.example.project.service.Survey.SurveyService;

@Controller
@RequestMapping("/survey/*") // url pattern
public class SurveyController {

	@Inject
	SurveyService surveyService;

	@Inject
	SurveyDAO surveyDao;

	@Inject
	HttpServletRequest request;
	
	@RequestMapping("list.do")
	public ModelAndView survey_list(ModelAndView mav) {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		int survey_complete = surveyDao.survey_complete(userid);
		mav.setViewName("fm/fm_survey-main");
		mav.addObject("list", surveyService.viewQuestion());
		mav.addObject("survey_complete", survey_complete);
		return mav;

	}

	@RequestMapping("insert.do")
	public String survey_insert(SurveyDTO dto) {
		String[] survey_idx = request.getParameterValues("survey_idx"); // 문제번호
		for (int i = 0; i < survey_idx.length; i++) {
			String answer = request.getParameter("q" + survey_idx[i]); // 응답번호
			SurveyResultDTO dto2 = new SurveyResultDTO();
			dto2.setSurvey_idx(Integer.parseInt(survey_idx[i]));
			dto2.setNum(Integer.parseInt(answer));
			surveyService.insertSurvey(dto2); // 레코드 저장
		}
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		surveyService.survey_check(userid);
		return "fm/fm_survey-submit"; // 결과 페이지로 이동

	}

	@RequestMapping("survey_result.do")
	public ModelAndView survey_result(ModelAndView mav) {
		int survey_idx = Integer.parseInt(request.getParameter("survey_idx"));
		List<SurveySummaryDTO> items = null;
		for (int i = 1; i <= surveyService.count(); i++) {
			items = surveyService.listSummary(survey_idx);
		}
		mav.setViewName("fm/fm_survey_result");
		mav.addObject("list", items);
		return mav;
	}

	@RequestMapping("survey_event.do")
	public ModelAndView survey_event(ModelAndView mav) {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		int survey_complete = surveyDao.survey_complete(userid);
		mav.setViewName("fm/fm_survey-event");
		mav.addObject("survey_complete", survey_complete);
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "event_result.do", method = RequestMethod.POST)
	public String sevent_result() {
		String result = "Congraturation!!~!"; //여기 랜덤으로 뽑아내는 기능..
		return result;
	}
	
	
	
}
