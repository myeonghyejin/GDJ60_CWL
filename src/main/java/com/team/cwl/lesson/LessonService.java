package com.team.cwl.lesson;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.util.Pagination;

@Service
public class LessonService {

	@Autowired
	private LessonDAO lessonDAO;
	
//----------------------------------------------
	
	/** SELECT **/
	public List<LessonDTO> getLessonList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(lessonDAO.getTotalCount(pagination));
		
		return lessonDAO.getLessonList(pagination);
	}

	public LessonDTO getLessonDetail(LessonDTO lessonDTO) throws Exception {
		lessonDAO.setLessonHitUpdate(lessonDTO);
		return lessonDAO.getLessonDetail(lessonDTO);
	}

	/** INSERT **/
	public int setLessonAdd(LessonDTO lessonDTO) throws Exception {
		return lessonDAO.setLessonAdd(lessonDTO);
	}

	/** UPDATE **/
	public int setLessonUpdate(LessonDTO lessonDTO) throws Exception {
		return lessonDAO.setLessonUpdate(lessonDTO);
	}

	/** DELETE **/
	public int setLessonDelete(LessonDTO lessonDTO) throws Exception {
		return lessonDAO.setLessonDelete(lessonDTO);
	}
	
}