package com.example.project.service.Survey;

import java.awt.Color;
import java.awt.Font;
import java.util.List;

import javax.inject.Inject;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Service;

import com.example.project.model.survey.dao.SurveyDAO;
import com.example.project.model.survey.dto.SurveyDTO;
import com.example.project.model.survey.dto.SurveyResultDTO;
import com.example.project.model.survey.dto.SurveySummaryDTO;


@Service
public class SurveyServiceImpl implements SurveyService {

	@Inject
	SurveyDAO surveyDao;
	
	@Override
	public int count() {
		return surveyDao.count();
	}

	@Override
	public List<SurveySummaryDTO> listSummary(int survey_idx) {
		return surveyDao.listSummary(survey_idx);
	}

	@Override
	public void insertSurvey(SurveyResultDTO dto) {
		surveyDao.insertSurvey(dto);
	}

	@Override
	public List<SurveyDTO> viewQuestion() {
		return surveyDao.viewQuestion();
	}

	@Override
	public void survey_check(String userid) {
		surveyDao.survey_check(userid);
	}
	
	

}
