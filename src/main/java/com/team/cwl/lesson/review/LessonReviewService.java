package com.team.cwl.lesson.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.util.Pagination;

@Service
public class LessonReviewService {
	
	@Autowired
	private LessonReviewDAO lessonReviewDAO;
	
//--------------------------------------------
	
	/** SELECT **/
	public List<LessonReviewDTO> getLessonReviewList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(lessonReviewDAO.getTotalCount(pagination));
		return lessonReviewDAO.getLessonReviewList(pagination);
	}

	/** INSERT **/
	public int setLessonReviewAdd(LessonReviewDTO lessonReviewDTO, HttpSession session) throws Exception {
		return lessonReviewDAO.setLessonReviewAdd(lessonReviewDTO);
	}
	
	/** UPDATE **/
	public int setLessonReviewUpdate(LessonReviewDTO lessonReviewDTO) throws Exception {
		return lessonReviewDAO.setLessonReviewUpdate(lessonReviewDTO);
	}
	
	/** DELETE **/
	public int setLessonReviewDelete(LessonReviewDTO lessonReviewDTO) throws Exception {
		return lessonReviewDAO.setLessonReviewDelete(lessonReviewDTO);
	}

}
