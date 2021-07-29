package com.example.project.model.survey.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.survey.dto.SurveyDTO;
import com.example.project.model.survey.dto.SurveyResultDTO;
import com.example.project.model.survey.dto.SurveySummaryDTO;

@Repository
public class SurveyDAOImpl implements SurveyDAO {

	@Inject
	SqlSession sqlSession;

	public int count() {
		return sqlSession.selectOne("survey.survey_count");
	}

	public List<SurveySummaryDTO> listSummary(int survey_idx) {
		return sqlSession.selectList("survey.list_summary", survey_idx);
	}

	public void insertSurvey(SurveyResultDTO dto) {
		sqlSession.insert("survey.insert_survey", dto);
	}

	public List<SurveyDTO> viewQuestion() {
		return sqlSession.selectList("survey.view_question");
	}

	public void survey_check(String userid) {
		sqlSession.update("member.survey_check", userid);

	}

	public int survey_complete(String userid) {
		int result = 0;
		if (userid != null) {
			if (userid.equals("admin")) {
				result = 1;
			} else {
				result = sqlSession.selectOne("member.survey_complete", userid);
			}
		}
		return result;
	}
}
