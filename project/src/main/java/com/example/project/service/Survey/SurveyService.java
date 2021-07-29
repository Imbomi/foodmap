package com.example.project.service.Survey;

import java.util.List;

import org.jfree.chart.JFreeChart;

import com.example.project.model.survey.dto.SurveyDTO;
import com.example.project.model.survey.dto.SurveyResultDTO;
import com.example.project.model.survey.dto.SurveySummaryDTO;

public interface SurveyService {
	int count();
	List<SurveySummaryDTO> listSummary(int survey_idx);
	void insertSurvey(SurveyResultDTO dto);
	List<SurveyDTO> viewQuestion();
	void survey_check(String userid);
}
