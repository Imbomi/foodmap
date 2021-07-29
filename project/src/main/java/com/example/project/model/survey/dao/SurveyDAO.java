package com.example.project.model.survey.dao;

import java.util.List;

import com.example.project.model.survey.dto.SurveyDTO;
import com.example.project.model.survey.dto.SurveyResultDTO;
import com.example.project.model.survey.dto.SurveySummaryDTO;

public interface SurveyDAO {
	int count();
	List<SurveySummaryDTO> listSummary(int survey_idx);
	void insertSurvey(SurveyResultDTO dto);
	List<SurveyDTO> viewQuestion();
	void survey_check(String userid);
	int survey_complete(String userid);
	
}
