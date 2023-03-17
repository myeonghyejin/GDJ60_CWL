package com.team.cwl.lesson;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.util.Pagination;

@Repository
public class LessonDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.team.cwl.lesson.LessonDAO.";

//--------------------------------------------
	
	/** SELECT **/
	public List<LessonDTO> getLessonList(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getLessonList", pagination);
	}

	public LessonDTO getLessonDetail(LessonDTO lessonDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getLessonDetail", lessonDTO);
	}

	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}
	
	/** INSERT **/
	public int setLessonAdd(LessonDTO lessonDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setLessonAdd", lessonDTO);
	}

	/** UPDATE **/
	public int setLessonUpdate(LessonDTO lessonDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setLessonUpdate", lessonDTO);
	}
	
	public int setLessonHitUpdate(LessonDTO lessonDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setLessonHitUpdate", lessonDTO);
	}

	/** DELETE **/
	public int setLessonDelete(LessonDTO lessonDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setLessonDelete", lessonDTO);
	}

}
